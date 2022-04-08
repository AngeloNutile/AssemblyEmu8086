; stampa i numeri nell'array fino a quando non trova 0

.MODEL SMALL
.DATA          
    numeri DB 3,7,8,1,2,0 ;array
     
.CODE
    ;carico i registri
    MOV AX, @DATA
    MOV DS, AX
     
    MOV BX, offset numeri ;si carica l'indirizzo della prima posizione
    MOV AH, 02h  ;imposto la stampa
      
    inizio:
        MOV DL, [BX] ;si carica in DX il valore di BX
        ADD DL, 30h  ;aggiungo 30h per stampare il carattere ASCII
        
        INT 21h
        
        INC BX       ;BX punterà al secondo elemento all'array
     
        CMP DL, 30h
     JNE inizio
     
     ;chiudo il programma
     MOV AH, 4Ch
     INT 21h
END