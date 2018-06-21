isLittleEndian():
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #12
  mov r3, #5
  str r3, [fp, #-12]
  sub r3, fp, #12
  str r3, [fp, #-8]
  ldr r3, [fp, #-8]
  ldrb r3, [r3] @ zero_extendqisi2
  cmp r3, #5
  bne .L2
  mov r3, #1
  b .L4
.L2:
  mov r3, #0
.L4:
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
.LC0:
  .ascii "Machine is Little Endian\000"
.LC1 [complete object constructor] [complete object constructor]:
  .ascii "Machine is Big Endian\000"
main:
  push {fp, lr}
  add fp, sp, #4
  bl isLittleEndian()
  mov r3, r0
  cmp r3, #0
  movne r3, #1
  moveq r3, #0
  and r3, r3, #255
  cmp r3, #0
  beq .L6
  ldr r0, .L9
  bl puts
  b .L7
.L6:
  ldr r0, .L9+4
  bl puts
.L7:
  mov r3, #0
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
.L9:
  .word .LC0
  .word .LC1 [complete object constructor] [complete object constructor]
