(in_da_begining)

@0
D=M
@1
D=D&A
@JEDAN1
D;JGT

@NULA1
0;JMP


(NULA1)
    @16414
    M=-1
    @16894
    M=-1 
    @DALJE1
    0;JMP

(JEDAN1)
    @32543
    D=A
    @16414
    M=D
    @16894
    M=D 

    @DALJE1
    0;JMP

(DALJE1)

@0
D=M
@2
D=D&A
@JEDAN2
D;JGT

@NULA2
0;JMP


(NULA2)
    @16412
    M=-1
    @16892
    M=-1
    @DALJE2
    0;JMP

(JEDAN2)
    @32543
    D=A
    @16412
    M=D
    @16892
    M=D

    @DALJE2
    0;JMP

(DALJE2)

@0
D=M
@4
D=D&A
@JEDAN3
D;JGT

@NULA3
0;JMP


(NULA3)
    @16410
    M=-1
    @16890
    M=-1
    @DALJE3
    0;JMP

(JEDAN3)
    @32543
    D=A
    @16410
    M=D
    @16890
    M=D

    @DALJE3
    0;JMP

(DALJE3)

@0
D=M
@8
D=D&A
@JEDAN4
D;JGT

@NULA4
0;JMP


(NULA4)
    @16408
    M=-1
    @16888
    M=-1
    @DALJE4
    0;JMP

(JEDAN4)
    @32543
    D=A
    @16408
    M=D
    @16888
    M=D

    @DALJE4
    0;JMP

(DALJE4)

@0
D=M
@16
D=D&A
@JEDAN5
D;JGT

@NULA5
0;JMP


(NULA5)
    @16406
    M=-1
    @16886
    M=-1
    @DALJE5
    0;JMP

(JEDAN5)
    @32543
    D=A
    @16406
    M=D
    @16886
    M=D

    @DALJE5
    0;JMP

(DALJE5)

@0
D=M
@32
D=D&A
@JEDAN6
D;JGT

@NULA6
0;JMP


(NULA6)
    @16404
    M=-1
    @16884
    M=-1
    @DALJE6
    0;JMP

(JEDAN6)
    @32543
    D=A
    @16404
    M=D
    @16884
    M=D

    @DALJE6
    0;JMP

(DALJE6)

@0
D=M
@64
D=D&A
@JEDAN7
D;JGT

@NULA7
0;JMP


(NULA7)
    @16402
    M=-1
    @16882
    M=-1
    @DALJE7
    0;JMP

(JEDAN7)
    @32543
    D=A
    @16402
    M=D
    @16882
    M=D

    @DALJE7
    0;JMP

(DALJE7)

@0
D=M
@128
D=D&A
@JEDAN8
D;JGT

@NULA8
0;JMP


(NULA8)
    @16400
    M=-1
    @16880
    M=-1
    @DALJE8
    0;JMP

(JEDAN8)
    @32543
    D=A
    @16400
    M=D
    @16880
    M=D

    @DALJE8
    0;JMP

(DALJE8)

@0
D=M
@256
D=D&A
@JEDAN9
D;JGT

@NULA9
0;JMP


(NULA9)
    @16398
    M=-1
    @16878
    M=-1
    @DALJE9
    0;JMP

(JEDAN9)
    @32543
    D=A
    @16398
    M=D
    @16878
    M=D

    @DALJE9
    0;JMP

(DALJE9)

@0
D=M
@512
D=D&A
@JEDAN10
D;JGT

@NULA10
0;JMP


(NULA10)
    @16396
    M=-1
    @16876
    M=-1
    @DALJE10
    0;JMP

(JEDAN10)
    @32543
    D=A
    @16396
    M=D
    @16876
    M=D

    @DALJE10
    0;JMP

(DALJE10)

@0
D=M
@1024
D=D&A
@JEDAN11
D;JGT

@NULA11
0;JMP


(NULA11)
    @16394
    M=-1
    @16874
    M=-1
    @DALJE11
    0;JMP

(JEDAN11)
    @32543
    D=A
    @16394
    M=D
    @16874
    M=D

    @DALJE11
    0;JMP

(DALJE11)

@0
D=M
@2048
D=D&A
@JEDAN12
D;JGT

@NULA12
0;JMP


(NULA12)
    @16392
    M=-1
    @16872
    M=-1
    @DALJE12
    0;JMP

(JEDAN12)
    @32543
    D=A
    @16392
    M=D
    @16872
    M=D

    @DALJE12
    0;JMP

(DALJE12)


@0
D=M
@4096
D=D&A
@JEDAN13
D;JGT

@NULA13
0;JMP


(NULA13)
    @16390
    M=-1
    @16870
    M=-1
    @DALJE13
    0;JMP

(JEDAN13)
    @32543
    D=A
    @16390
    M=D
    @16870
    M=D

    @DALJE13
    0;JMP

(DALJE13)

@0
D=M
@8192
D=D&A
@JEDAN14
D;JGT

@NULA14
0;JMP


(NULA14)
    @16388
    M=-1
    @16868
    M=-1
    @DALJE14
    0;JMP

(JEDAN14)
    @32543
    D=A
    @16388
    M=D
    @16868
    M=D

    @DALJE14
    0;JMP

(DALJE14)

@0
D=M
@16384
D=D&A
@JEDAN15
D;JGT

@NULA15
0;JMP


(NULA15)
    @16386
    M=-1
    @16866
    M=-1
    @DALJE15
    0;JMP

(JEDAN15)
    @32543
    D=A
    @16386
    M=D
    @16866
    M=D

    @DALJE15
    0;JMP

(DALJE15)

@32767
D=A
D=-D
D=D-1
@0
D=D&M
@JEDAN16
D;JLT

@NULA16
0;JMP


(NULA16)
    @16384
    M=-1
    @16864
    M=-1
    @DALJE16
    0;JMP

(JEDAN16)
    @32543
    D=A
    @16384
    M=D
    @16864
    M=D

    @DALJE16
    0;JMP

(DALJE16)

@0
M=M+1;
(LOOP)
@KBD
D=M;
@85
D=D-A
@in_da_begining
D;JEQ
@LOOP
0;JMP
