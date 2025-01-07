@i
M = 0;
@32767
D=A
@5
M=D
(LOOP)// for (int i = 0; i < 5; i++)
	@i // adrese idu od 0 do 4
	D=M;
	@5
	D=D-A;
	@ZAVRSI 
	D;JGE
	
	@i
	A=M;
	D=M;
	@NEGATIVNO // greska idi dalje
	D;JLE

    @5
	D=D-M;
	@ANTIMIN // greska idi dalje
	D;JGE
	
	@i    //upis
	A=M;
	D=M;
	@5
	M=D;
	
    (ANTIMIN)
	(NEGATIVNO)
	@i
	M=M+1;
	@LOOP
	0;JMP
(ZAVRSI)

(E)
@E
0;JMP