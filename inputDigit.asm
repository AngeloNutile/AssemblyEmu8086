; --------------------------------------------------------------       
; Leggere un intero da tastiera e memorizzarlo in una variabile
; * in Assembly l'input di un numero e' un input di un carattere
; * per tale motivo viene letto in AL la sua codifica ASCII
; * va poi trasformato nel suo valore numerico sottraendo 30h 
; --------------------------------------------------------------
.MODEL SMALL
.DATA
    num DB ?
.CODE
     
    MOV AX, DATA   ; devo inizializzare DS con l'indirizzo del DATA SEGMENT  
    MOV DS, AX
                
    MOV AH, 01h    ; comando per INPUT da tastiera che sara' messo in AL       
    INT 21h;       ; interrupt per il Sistema Operativo
    
    SUB AL, 30h    ; sottraggo 30h per il valore e non la sua codifica ASCII
    MOV num, AL    ; copio il contenuto nella variabile 
    
    MOV AH, 4Ch    ; restituisco il controllo al Sistema Operativo
    INT 21h
END        
