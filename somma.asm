; --------------------------------------------------------------------------------
; Somma il contenuto di due variabiali e salva il risultato in una terza variabile
; RESULT = NUM1+NUM2
; --------------------------------------------------------------------------------
.MODEL SMALL   ; indica al compilatore il modello di memoria da usare 
.DATA
     NUM1 DB 9h    ; dichiaro una variabile NUM1 di 1 Byte inizializzata a 9h (esadecimale)
     NUM2 DB 7h    ; dichiaro una variabile NUM2 di 1 Byte inizializzata a 7h (esadecimale)
     RESULT DB ?   ; dichiaro una variabile vuota
.CODE   
    MOV AX,DATA  ; copiamo in AX indirizzo di partenza del segmento DATA
    MOV DS,AX    ; copiamo ora nel registro DS tale valore
    
    MOV AL,NUM1  ; AL conterra' 9h (posso utilizzare il registro AL 8 bit)
    ADD AL,NUM2  ; AL = AL + 7h = 10h
    
    MOV RESULT,AL ; salviamo il risultato  
    
    MOV AH, 4Ch ; indica che il processo e' terminato, e diamo il controllo al sistema operativo
    INT 21h     ; interrupt 21 per richiamare un servizio al Sistema Operativo
 
END
