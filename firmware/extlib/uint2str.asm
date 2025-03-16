; Firmware of RC6502 Apple1 Replica
; Copyright (c) 2025 Arvid Juskaitis

; addresses within tmp_buffer
uint2str_buffer     = tmp_buffer    ; 6 bytes
uint2str_number     = tmp_buffer+6  ; 2 bytes
uint2str_remainder  = tmp_buffer+8  ; 1 byte

; conversion from uint16 to string
; input - uint2str_number, uint2str_number+1
; output - uint2str_buffer 
uint2str:
    cld                     ; Ensure decimal mode is off

    ; Initialize buffer with spaces for right alignment
    ldx #4                  ; Now the last index is 4
    lda #' '                ; Space character
fill_buffer:
    sta uint2str_buffer, x
    dex
    bpl fill_buffer
    lda #0                  ; null terminate string
    sta uint2str_buffer+5
    
    ldx #4                  ; Start storing digits from the rightmost position

uint2str_loop:
    lda uint2str_number
    ora uint2str_number+1
    beq adjust_output       ; If number is zero, stop converting

    lda #0
    sta uint2str_remainder  ; Clear remainder

    ldy #16                 ; 16-bit division by 10
div_loop:
    asl uint2str_number     ; Shift left (multiplying by 2)
    rol uint2str_number+1
    rol uint2str_remainder  ; Shift remainder

    lda uint2str_remainder
    sec
    sbc #10                 ; Try subtracting 10
    bcc no_subtract         ; If borrow set, restore remainder

    sta uint2str_remainder
    inc uint2str_number     ; Properly store quotient

no_subtract:
    dey
    bne div_loop            ; Loop until division is done

    lda uint2str_remainder  ; Extract digit (remainder)
    clc
    adc #'0'                ; Convert to ASCII
    sta uint2str_buffer, x  ; Store digit in buffer
    dex
    bpl uint2str_loop       ; Keep converting

adjust_output:
    ; Ensure at least one digit is printed
    inx                     ; Move pointer to first digit
    cpx #5                  ; Now check against 5
    bne done
    lda #'0'
    sta uint2str_buffer+4   ; Last character

done:
    rts
