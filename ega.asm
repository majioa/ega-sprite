.286
.MODEL	SMALL
.STACK	100H
ASSUME	CS:COD
COD	SEGMENT PARA
ASSUME	DS:DAT,SS:STACK
EGA1	PROC
	PUSH	DS
	POP	SS
	MOV	AX,12H
	INT	10H
	MOV	AX,DAT
	MOV	DS,AX
	MOV	ES,AX
	LEA	SI,CGAF
	LEA	DX,BUF
	CALL	LOAD_FILE
	LEA	SI,SPR_
	LEA	DI,STBL
	CALL	WW
	MOV	AH,7
	INT	21H
	MOV	AX,3
	INT	10H
	MOV	AX,4C00H
	INT	21H
ENDP
INCLUDE EGA.286
INCLUDE IO.LIB
ENDS
DAT	SEGMENT PARA
CGAF	DB	'CGA.FNT',0,0,0,0
STR_	DB	'PPPPP',0
STBL	DD	DAT:BUF
	DW	48
	DW	48
	DB	8
	DB	4
	DB	9
	DB	5	 DUP	 (0)
BUF:
ENDS
END     EGA1