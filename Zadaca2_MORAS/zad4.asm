// horizontala
@22534
M=-1
@22535
M=-1
@22536
M=-1
@22537
M=-1
@22538
M=-1
@22539
M=-1
@22540
M=-1
@22541
M=-1
//simetrala okomica stogod

@2
D=A
@22502
M=D

@4
D=A
@22470
M=D

@8
D=A
@22438
M=D

@16
D=A
@22406
M=D

@32
D=A
@22374
M=D

@64
D=A
@22342
M=D

@128
D=A
@22310
M=D

@256
D=A
@22278
M=D

@512
D=A
@22246
M=D

@1024
D=A
@22214
M=D

@2048
D=A
@22182
M=D

@4096
D=A
@22150
M=D

@8192
D=A
@22118
M=D

@16384
D=A
@22086
M=D

@32767
D=A
D=-D
D=D-1
@22054
M=D

@1
D=A
@22023
M=D

@2
D=A
@21991
M=D

@4
D=A
@21959
M=D

@8
D=A
@21927
M=D

@16
D=A
@21895
M=D

@32
D=A
@21863
M=D

@64
D=A
@21831
M=D

@128
D=A
@21799
M=D

@256
D=A
@21767
M=D

@512
D=A
@21735
M=D

@1024
D=A
@21703
M=D

@2048
D=A
@21671
M=D

@4096
D=A
@21639
M=D

@8192
D=A
@21607
M=D

@16384
D=A
@21575
M=D

@32767
D=A
D=-D
D=D-1
@21543
M=D

@1
D=A
@21512
M=D

@2
D=A
@21480
M=D

@4
D=A
@21448
M=D

@8
D=A
@21416
M=D

@16
D=A
@21384
M=D

@32
D=A
@21352
M=D

@64
D=A
@21320
M=D

@128
D=A
@21288
M=D

@256
D=A
@21256
M=D

@512
D=A
@21224
M=D

@1024
D=A
@21192
M=D

@2048
D=A
@21160
M=D

@4096
D=A
@21128
M=D

@8192
D=A
@21096
M=D

@16384
D=A
@21064
M=D

@32767
D=A
D=-D
D=D-1
@21032
M=D

@1
D=A
@21001
M=D

@2
D=A
@20969
M=D

@4
D=A
@20937
M=D

@8
D=A
@20905
M=D

@16
D=A
@20873
M=D

@32
D=A
@20841
M=D

@64
D=A
@20809
M=D

@128
D=A
@20777
M=D

@256
D=A
@20745
M=D

@512
D=A
@20713
M=D

@1024
D=A
@20681
M=D

@2048
D=A
@20649
M=D

@4096
D=A
@20617
M=D

@8192
D=A
@20585
M=D

@16384
D=A
@20553
M=D

@32767
D=A
D=-D
D=D-1
@20521
M=D



// hipotenuza
@18918
D=A
@CURRENT_ADDR16
M=D

(LOOP16)
    @CURRENT_ADDR16
    D=M
    @22541
    D=D-A
    @END_LOOP16
    D;JGE

    @32767
    D=A
    D=-D
    D=D-1
    @CURRENT_ADDR16
    A=M
    M=D

    @CURRENT_ADDR16
    D=M
    @513
    D=D+A
    @CURRENT_ADDR16
    M=D

    @LOOP16
    0;JMP

(END_LOOP16)

@18438
D=A
@CURRENT_ADDR1
M=D
(LOOP1)
    @CURRENT_ADDR1
    D=M
    @22541
    D=D-A
    @END_LOOP1
    D;JGE
    @1
    D=A
    @CURRENT_ADDR1
    A=M
    M=D
    @CURRENT_ADDR1
    D=M
    @513
    D=D+A
    @CURRENT_ADDR1
    M=D

    @LOOP1
    0;JMP
(END_LOOP1)

@18470
D=A
@CURRENT_ADDR2
M=D
(LOOP2)
    @CURRENT_ADDR2
    D=M
    @22541
    D=D-A
    @END_LOOP2
    D;JGE
    @2
    D=A
    @CURRENT_ADDR2
    A=M
    M=D
    @CURRENT_ADDR2
    D=M
    @513
    D=D+A
    @CURRENT_ADDR2
    M=D

    @LOOP2
    0;JMP
(END_LOOP2)

@18502
D=A
@CURRENT_ADDR3
M=D
(LOOP3)
    @CURRENT_ADDR3
    D=M
    @22541
    D=D-A
    @END_LOOP3
    D;JGE
    @4
    D=A
    @CURRENT_ADDR3
    A=M
    M=D
    @CURRENT_ADDR3
    D=M
    @513
    D=D+A
    @CURRENT_ADDR3
    M=D

    @LOOP3
    0;JMP
(END_LOOP3)

@18534
D=A
@CURRENT_ADDR4
M=D
(LOOP4)
    @CURRENT_ADDR4
    D=M
    @22541
    D=D-A
    @END_LOOP4
    D;JGE
    @8
    D=A
    @CURRENT_ADDR4
    A=M
    M=D
    @CURRENT_ADDR4
    D=M
    @513
    D=D+A
    @CURRENT_ADDR4
    M=D

    @LOOP4
    0;JMP
(END_LOOP4)

@18566
D=A
@CURRENT_ADDR5
M=D
(LOOP5)
    @CURRENT_ADDR5
    D=M
    @22541
    D=D-A
    @END_LOOP5
    D;JGE
    @16
    D=A
    @CURRENT_ADDR5
    A=M
    M=D
    @CURRENT_ADDR5
    D=M
    @513
    D=D+A
    @CURRENT_ADDR5
    M=D

    @LOOP5
    0;JMP
(END_LOOP5)

@18598
D=A
@CURRENT_ADDR6
M=D
(LOOP6)
    @CURRENT_ADDR6
    D=M
    @22541
    D=D-A
    @END_LOOP6
    D;JGE
    @32
    D=A
    @CURRENT_ADDR6
    A=M
    M=D
    @CURRENT_ADDR6
    D=M
    @513
    D=D+A
    @CURRENT_ADDR6
    M=D

    @LOOP6
    0;JMP
(END_LOOP6)

@18630
D=A
@CURRENT_ADDR7
M=D
(LOOP7)
    @CURRENT_ADDR7
    D=M
    @22541
    D=D-A
    @END_LOOP7
    D;JGE
    @64
    D=A
    @CURRENT_ADDR7
    A=M
    M=D
    @CURRENT_ADDR7
    D=M
    @513
    D=D+A
    @CURRENT_ADDR7
    M=D

    @LOOP7
    0;JMP
(END_LOOP7)

@18662
D=A
@CURRENT_ADDR8
M=D
(LOOP8)
    @CURRENT_ADDR8
    D=M
    @22541
    D=D-A
    @END_LOOP8
    D;JGE
    @128
    D=A
    @CURRENT_ADDR8
    A=M
    M=D
    @CURRENT_ADDR8
    D=M
    @513
    D=D+A
    @CURRENT_ADDR8
    M=D

    @LOOP8
    0;JMP
(END_LOOP8)

@18694
D=A
@CURRENT_ADDR9
M=D
(LOOP9)
    @CURRENT_ADDR9
    D=M
    @22541
    D=D-A
    @END_LOOP9
    D;JGE
    @256
    D=A
    @CURRENT_ADDR9
    A=M
    M=D
    @CURRENT_ADDR9
    D=M
    @513
    D=D+A
    @CURRENT_ADDR9
    M=D

    @LOOP9
    0;JMP
(END_LOOP9)

@18726
D=A
@CURRENT_ADDR10
M=D
(LOOP10)
    @CURRENT_ADDR10
    D=M
    @22541
    D=D-A
    @END_LOOP10
    D;JGE
    @512
    D=A
    @CURRENT_ADDR10
    A=M
    M=D
    @CURRENT_ADDR10
    D=M
    @513
    D=D+A
    @CURRENT_ADDR10
    M=D

    @LOOP10
    0;JMP
(END_LOOP10)

@18758
D=A
@CURRENT_ADDR11
M=D
(LOOP11)
    @CURRENT_ADDR11
    D=M
    @22541
    D=D-A
    @END_LOOP11
    D;JGE
    @1024
    D=A
    @CURRENT_ADDR11
    A=M
    M=D
    @CURRENT_ADDR11
    D=M
    @513
    D=D+A
    @CURRENT_ADDR11
    M=D

    @LOOP11
    0;JMP
(END_LOOP11)

@18790
D=A
@CURRENT_ADDR12
M=D
(LOOP12)
    @CURRENT_ADDR12
    D=M
    @22541
    D=D-A
    @END_LOOP12
    D;JGE
    @2048
    D=A
    @CURRENT_ADDR12
    A=M
    M=D
    @CURRENT_ADDR12
    D=M
    @513
    D=D+A
    @CURRENT_ADDR12
    M=D

    @LOOP12
    0;JMP
(END_LOOP12)

@18822
D=A
@CURRENT_ADDR13
M=D
(LOOP13)
    @CURRENT_ADDR13
    D=M
    @22541
    D=D-A
    @END_LOOP13
    D;JGE
    @4096
    D=A
    @CURRENT_ADDR13
    A=M
    M=D
    @CURRENT_ADDR13
    D=M
    @513
    D=D+A
    @CURRENT_ADDR13
    M=D

    @LOOP13
    0;JMP
(END_LOOP13)

@18854
D=A
@CURRENT_ADDR14
M=D
(LOOP14)
    @CURRENT_ADDR14
    D=M
    @22541
    D=D-A
    @END_LOOP14
    D;JGE
    @8192
    D=A
    @CURRENT_ADDR14
    A=M
    M=D
    @CURRENT_ADDR14
    D=M
    @513
    D=D+A
    @CURRENT_ADDR14
    M=D

    @LOOP14
    0;JMP
(END_LOOP14)

@18886
D=A
@CURRENT_ADDR15
M=D
(LOOP15)
    @CURRENT_ADDR15
    D=M
    @22541
    D=D-A
    @END_LOOP15
    D;JGE
    @16384
    D=A
    @CURRENT_ADDR15
    A=M
    M=D
    @CURRENT_ADDR15
    D=M
    @513
    D=D+A
    @CURRENT_ADDR15
    M=D

    @LOOP15
    0;JMP
(END_LOOP15)


// veritikala
@18438
D=A
@CURRENT_ROW
M=D

(FOR_LOOP)
    @CURRENT_ROW
    D=M
    @22534
    D=D-A
    @END_LOOP
    D;JGE

    @1
    D=A
    @CURRENT_ROW
    A=M
    M=M|D

    @CURRENT_ROW
    D=M
    @32
    D=D+A
    @CURRENT_ROW
    M=D

    @FOR_LOOP
    0;JMP

(END_LOOP)
    @END_LOOP
    0;JMP

