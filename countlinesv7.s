.LC0:
  .ascii "Program that counts lines.\000"
.LC1 [complete object constructor] [complete object constructor]:
  .ascii "r\000"
.LC2 [base object constructor] [base object constructor]:
  .ascii "Total lines: %d\012\000"
main:
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #24
  str r0, [fp, #-24]
  str r1, [fp, #-28]
  mov r3, #0
  str r3, [fp, #-8]
  ldr r0, .L5
  bl puts
  ldr r3, [fp, #-28]
  ldr r3, [r3, #4]
  str r3, [fp, #-12]
  ldr r1, .L5+4
  ldr r0, [fp, #-12]
  bl fopen
  mov r3, r0
  str r3, [fp, #-16]
.L4:
  ldr r0, [fp, #-16]
  bl fgetc
  mov r3, r0
  str r3, [fp, #-20]
  ldr r3, [fp, #-20]
  cmn r3, #1
  movne r3, #1
  moveq r3, #0
  and r3, r3, #255
  cmp r3, #0
  beq .L2
  ldr r3, [fp, #-20]
  cmp r3, #10
  bne .L4
  ldr r3, [fp, #-8]
  add r3, r3, #1
  str r3, [fp, #-8]
  b .L4
.L2:
  ldr r1, [fp, #-8]
  ldr r0, .L5+8
  bl printf
  ldr r0, [fp, #-16]
  bl fclose
  mov r0, #0
  bl exit
.L5:
  .word .LC0
  .word .LC1 [complete object constructor] [complete object constructor]
  .word .LC2 [base object constructor] [base object constructor]
