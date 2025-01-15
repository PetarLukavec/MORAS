# IDEJA
# 1. Iz asemblerske datoteke izbaciti sve razmake i komentare. Sjetite
#    se kako komentari u hack asembleru mogu biti jednolinijski i
#    viselinijski.
# 2. Sve simbole i varijable pretvoriti u numericke adrese (brojevi
#    linija ili adrese u memoriji).
# 3. Parsirati naredbe (A i C-instrukcije).

class Parser:
    from parseLines import _parse_lines, _parse_line
    from parseComms import _parse_commands, _parse_command, _init_comms
    from parseSymbs import _parse_symbols, _parse_labels, _parse_variables, _init_symbols
    
    def __init__(self, filename):
        # Otvaramo input asemblersku datoteku.
        self._flag = True # Ukoliko je flag postavljen na False, parsiranje je neuspjesno.
        self._line = -1   # lokacija (broj linije) na kojoj se pogreska nalazi.
        self._errm = ""   # Poruka koja opisuje pogresku.
        self._counter = 0
        self._loop_stack = []
        try:
            self._file = open(filename + ".asm", "r")
        except:
            Parser._error("File", -1, "Cannot open source file")
            return

        # Linije iz input datoteke upisujuemo u ovu listu.
        self._lines = []
        
        # Citamo input datoteku.
        try:
            self._read_lines()
        except:
            Parser._error("File", -1, "Cannot read source file.")
            return

        # Pogreske prilikom parsiranja.

        # Parsiramo linije izvornog koda.
        self._parse_lines()
        if self._flag == False:
            Parser._error("PL", self._line, self._errm)
            return
        
        # oznake
        self._labels = {}
        self._variables = {}
        
        self._parse_symbols()
        if self._flag == False:
            Parser._error("SYM", self._line, self._errm)
            return
            
        self._parse_commands()
        if self._flag == False:
            Parser._error("COM", self._line, self._errm)
            return
            
        # Na kraju parsiranja strojni kod upisujemo u ".hack" datoteku.
        try:
            self._outfile = open(filename + ".hack", "w")
        except:
            Parser._error("File", -1, "Cannot open output file")
            return

        try:
            self._write_file()
        except:
            Parser._error("File", -1, "Cannot write to output file")
            return          

    # Funkcija koja cita input datoteku te svaki redak sprema u listu uredjenih
    # trojki kojima su koordinate
    #   1. originalna linija iz datoteke
    #   2. broj linije u parsiranoj datoteci (u pocetku isti kao 3.)
    #   3. broj linije u originalnoj datoteci


    def check_num_between_0_32767_help(self, n: int, line: str): #zad1
        if line[0] != "@":
            return True
        if line == "":
            return True
        else:
            line = line.replace("@", "")

            if line.strip().isnumeric():
                num = int(line)
                if num < 0 or num > 32767:
                    return False
            if line.count("-")>0:
                return False

        return True

    def check_num_between_0_32767(self, n: int, line: str): #zad1
        if not self.check_num_between_0_32767_help(n, line):
            self._flag = False
            self._line = n
            self._errm = "linija nije izmedu 0 i 32767"
            Parser._error("X", self._line, self._errm)
            return True
        return False

    def check_makro(self,line:str)->bool: #zad2
        if line.strip() == "":
            return False
        if line.strip()[0] == "$":
            print("makro detected")
            return True
    
    def get_makro(self, line: str, n: int) -> str: #zad2
        line = line.strip()
        try:
            if line.startswith("$MV"):
                A = line[3:].strip("()").split(",")
                if len(A) != 2:
                    self._flag = False
                    self._line = n
                    self._errm = "Makro naredba nije ispravna"
                    Parser._error("X", self._line, self._errm)
                    return ""
                return f"@{A[0].strip()}\nD=M\n@{A[1].strip()}\nM=D"

            elif line.startswith("$SWP"):
                A = line[4:].strip("()").split(",")
                if len(A) != 2:
                    self._flag = False
                    self._line = n
                    self._errm = "Makro naredba nije ispravna"
                    Parser._error("X", self._line, self._errm)
                    return ""
                return f"@{A[0].strip()}\nD=M\n@R13\nM=D\n@{A[1].strip()}\nD=M\n@{A[0].strip()}\nM=D\n@R13\nD=M\n@{A[1].strip()}\nM=D"

            elif line.startswith("$ADD"):
                A = line[4:].strip("()").split(",")
                if len(A) != 3:
                    self._flag = False
                    self._line = n
                    self._errm = "Makro naredba nije ispravna"
                    Parser._error("X", self._line, self._errm)
                    return ""
                return f"@{A[0].strip()}\nD=M\n@{A[1].strip()}\nD=D+M\n@{A[2].strip()}\nM=D"
            elif line.startswith("$WHILE"):
                self._counter += 1
                condition = line[6:].strip("()")
                loop_label = f"LOOP{self._counter}"
                end_label = f"END{self._counter}"
                self._loop_stack.append((loop_label, end_label))
                return f"({loop_label})\n@{condition}\nD=M\n@{end_label}\nD;JEQ"

            elif line.startswith("$END"):
                loop_label, end_label = self._loop_stack.pop()
                return f"@{loop_label}\n0;JMP\n({end_label})"
            else:
                raise ValueError

        except ValueError:
            self._flag = False
            self._line = n
            self._errm = "Makro naredba nije ispravna"
            Parser._error("X", self._line, self._errm)
            return ""
    

    def _read_lines(self):
        n = 0

        for line in self._file:
            if line != "\n": # izbjegavamo prazne linije
                if self.check_num_between_0_32767(n,line.strip()):
                    return

                if self.check_makro(line):
                    makro_lines = self.get_makro(line, n)
                    if not makro_lines:
                        return

                    for makro_line in makro_lines.split("\n"):
                        if makro_line.strip():
                            self._lines.append((makro_line+"\n", n, n))
                            n += 1

                else:
                    # Dodavanje običnih linija
                    self._lines.append((line, n, n))
                    n += 1
        
        print(self._lines)
        asm = ""
        for (a,i,j) in self._lines:
            asm = asm + a
        print(asm)


    # Funkcija upisuje parsirane linije u output ".hack" datoteku.
    def _write_file(self):
        for (line, p, o) in self._lines:
            self._outfile.write(line)
            if (line[-1] != "\n"):
                self._outfile.write("\n")

    # Funkcija iterira procitanim linijama i na svaku primjenjuje funkciju
    # "func". Funkcija "func" vraća string koji odgovara vrijednosti parsirane
    # linije.
    #
    # Primjer:
    # ("@END", 4, 4) postaje ("@3", 3, 4)
    #
    # Ukoliko je duljina vracene linije 0, tu liniju brisemo. Takodjer, svaka
    # funkcija "func" mora se brinuti o pogreskama na koje moze naici (npr.
    # viselinijski komentari koji nisu zatvoreni ili pogresna naredba M=B+1).
    def _iter_lines(self, func):
        newlines = []
        i = 0
        for (line, p, o) in self._lines:
            newline = func(line, i, o)
            if (self._flag == False):
                break
            if (len(newline) > 0):
                newlines.append((newline, i, o))
                i += 1
        self._lines = newlines
        
    @staticmethod
    def _error(src, line, msg):
        if len(src) > 0 and line > -1:
            print("[" + src + ", " + str(line) + "] " + msg)
        elif len(src) > 0:
            print("[" + src + "] " + msg)
        else:
            print(msg)


if __name__ == "__main__":
    Parser("test2")
