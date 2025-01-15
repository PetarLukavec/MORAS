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
        self._flag = True # Ukoliko je flag postavljen na False, parsiranje je neuspjesno.
        self._line = -1   # lokacija (broj linije) na kojoj se pogreska nalazi.
        self._errm = ""   # Poruka koja opisuje pogresku.

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
        if not line.strip() or line[0] != "@":
            return True

        try:
            if line.replace("@", "").strip().isnumeric():
                num = int(line.replace("@", "").strip())
                if num < 0 or num > 32767:
                    return False

        except ValueError:
            return False

        return True

    def check_num_between_0_32767(self, n: int, line: str): #zad1
        if not self.check_num_between_0_32767_help(n, line):
            self._flag = False
            self._line = n
            self._errm = "linija nije izmedu 0 i 32767"
            Parser._error("X", self._line, self._errm)
            return True

    def check_makro(self,line:str)->bool: #zad2
        if line.strip() == "":
            return False
        if line.strip()[0] == "$":
            print("makro detected")
            return True

    def get_makro(self,line:str,n:int)->str: #zad2
        line = line.strip()
        if line[1] == "M" and line[2] == "V":
            A = line[3:]
            A = A.strip("()")
            A = A.split(",")
            print(A)
            return f"@{A[0]}\nD=M\n@{A[1]}\nM=D"
        elif line[1] == "S" and line[2] == "W" and line[3] == "P":
            return "@12"
        elif line[1] == "A" and line[2] == "D" and line[3] == "D":
            return "@12"
        #elif line[1] == "W" and line[2] == "H" and line[3] == "I" and line[4] == "L" and line[5] == "E": poslije cemo while
        #    return "@12"
        else:
            self._flag = False
            self._line = n
            self._errm = "Makro naredba nije prepoznata"
            Parser._error("X", self._line, self._errm)
            return
    

    def _read_lines(self):
        n = 0

        for line in self._file:
            if self.check_num_between_0_32767(n,line.strip()):
                return
            if self.check_makro(line):
                line = self.get_makro(line,n)
                if line == "":
                    return
                
                lines = line.split("\n")
                print(lines)
                for i in lines:
                    self._lines.append((i, n, n))
                    n += 1
                print(self._lines)
                    
            else:
                self._lines.append((line, n, n))
                n += 1
                print(line)

            #print(line)
            #self._lines.append((line, n, n))
            #n += 1


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
    Parser("test1")
