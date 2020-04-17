; -------------------------------------------------------------------------------------------
; Come stampare un messaggio "memorizzato" in una variabile
; * in Assembly e' possibile creare una variabile che
; * puntera' ad una stringa. La stringa terminera' con il carattere speciale $.
; * inoltre sara' possibile inserire dei caratteri ASCII per adare a capo, o per altri scopi.
; *
; * per visualizzare il messaggio, sara' necessario caricare
; *  1. caricare l'offset (indirizzo di partenza) in DX
; *  2. impostare il codice 09h in AH
; * per caricare l'offset possiamo usare l'istruzione LEA DX, msg o MOV DX, OFFSET msg
; * entrambe le istruzioni saranno tradotte in MOV DX, indirizzo puntato da msg 
; -------------------------------------------------------------------------------------------
.MODEL SMALL
.STACK 0100h
.DATA
    msg1 DB "ciao$" ;ogni messaggio deve terminare con il carattere speciale $$
    msg2 DB "mamma",10,13,"$" ;puoi innestare anche codici ASCII (13=CR) e (10=LF)
    msg3 DB "sono io",07,"$"  ;ASCII 7 beep
    newline DB 10,13, "$"  ; NEWLINE 
  
.CODE
    MOV AX, DATA  ; imposto l'inizio del data segment
    MOV DS, AX
    
    MOV AH, 09h   ; imposto il codice per interrupt (09= stampa stringa)
    
    LEA DX, msg1  ; in DX viene caricato offset di msg1 (ovvero l'indirizzo di partenza:00000h)
    INT 21h
    
    LEA DX, msg2  ; in DX viene caricato offset di msg2 (00005h)
    INT 21h     
                        
    ; LEA puo' essere sostituto da MOV DX, OFFSET
    
    MOV DX, OFFSET msg3; indirizzo di partenza (0000Dh, cioe' 13) 
    INT 21h  
    
    MOV AH, 4Ch   ; restituisco il controllo al sistema operativo
    INT 21h
END
