; --------------------------------------------------
; Input controllato
;       accettare in input un carattere numerico, 
;       visualizzarlo ed inserirlo in una variabile
; --------------------------------------------------
; ricordiamo che i numeri da 0 a 9 sono codificati
; in ASCII da 30h a 39h
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
; JL  = Jump if Less (salta se a<b)
; JLE = Jump if Less or Equal (salta se a<=b)
; JG  = Jump if Great (salta se a>b)
; JGE = Jump if Great or Equal (salta se a=>b)
; --------------------------------------------------
.MODEL SMALL
.STACK 0100h
.DATA
    numA DB ?     
.CODE
    MOV AX, DATA  ; imposto l'inizio del data segment
    MOV DS, AX

    ; stampo il carattere ? per indicare che aspettiamo un INPUT    
    MOV DL,'?'
    MOV AH, 02h
    INT 21h  
    
    ; preparo la lettura
    MOV AH, 07h  ;prepariamo INPUT (07h = INPUT WITHOUT ECHO)
   
    ; input controllato (A)  
    leggi: 
        INT 21h      ; INPUT
        CMP AL,30h   ; confronto se A<0 
        JL leggi     ; se minore di 30h ripetere INPUT
        CMP AL,39h   ; confronto se A>9
        JG leggi     ; se maggiroe di 39h ripetere INPUT
    ; stampo il carattere letto
    MOV DL, AL       ; stampo il carattere
    MOV AH, 02h
    INT 21h
    
    ; memorizziamo il valore (non il codice ASCII) in una variabile      
    SUB DL, 30h      ; sottraiamo 30h per avere il valore 
    MOV numA, DL     ; copiamo il contenuto nella variabile
    
    MOV AH, 4Ch   ; restituisco il controllo al sistema operativo
    INT 21h
END
