; --------------------------------------------------
; Ciclo per chiedere in input dei caratteri
; fino a quando non e'inserito il carattere INVIO
;  invio = 13 base 10 oppure Dh base 16  (ASCII)
; --------------------------------------------------  
; CMP a,b - confronta i due operandi
;           in pratica effettua una sottrazione
;           imposta i flags 
;               ZF = 0 se a != b    ZF = 1 se a == b
;               CF = 0 se a >= b    CF = 1 se a < b
; -------------------------------------------------- 
; J = JUMP - salto condizionato
; JNE = Jump if Not Equal (salta se ZF== 0)
; JE  = Jump if Equal (salta se ZF == 1) 
; --------------------------------------------------

.MODEL SMALL
.STACK 0100h
.DATA
        
.CODE
    MOV AX, DATA  ; imposto l'inizio del data segment
    MOV DS, AX

    ;stampo il carattere ? per indicare che aspettiamo un INPUT    
    MOV DL,'?'
    MOV AH, 02h
    INT 21h
        
    MOV AH, 01h   ; prepariamo INPUT (codice 01h)
    
    ciclo:     
        INT 21h   ; INPUT
        CMP AL, 13; compara il codice ASCII con 13 (invio Dh oppure 13)
    JNE ciclo     ; va all'etichetta se il precedente confronto se .p'p'p  
          
   
    
    MOV AH, 4Ch   ; restituisco il controllo al sistema operativo
    INT 21h
END
