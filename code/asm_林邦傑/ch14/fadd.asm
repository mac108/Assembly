; ****************** fadd.asm ****************
;
       ORG   0100H
       JMP   start
a      DD    1.5
b      DD    3.5
sum    DD    0.0
plus   DB    ' + ', '$'
equal  DB    ' = ', '$'
;
%include "..\mymacro\dispf.mac"
%include "..\mymacro\dispstr.mac"
;
start:
       FINIT                 ;浮點堆疊初始化
       FLD     DWORD [a]     ;TOS=a
       FADD    DWORD [b]     ;TOS=a+b
       FSTP    DWORD [sum]   ;sum=TOS
       dispf   a,  3         ;顯示a,三位小數
       dispstr plus          ;列印 '+'
       dispf   b,  3         ;顯示b,三位小數
       dispstr equal         ;列印 '='
       dispf   sum , 3       ;顯示sum,三位小數
;
       MOV     AX, 4c00H
       INT     21H           ;返回作業系統
