.LC0:
  .ascii "Factorial of %d = %llu\000"
main:
  push {r4, fp, lr}
  add fp, sp, #8
  sub sp, sp, #28
  mov r3, #1
  mov r4, #0
  str r3, [fp, #-28]
  str r4, [fp, #-24]
  mov r3, #5
  str r3, [fp, #-32]
  mov r3, #1
  str r3, [fp, #-16]
.L3:
  ldr r2, [fp, #-16]
  ldr r3, [fp, #-32]
  cmp r2, r3
  bgt .L2
  ldr r3, [fp, #-16]
  mov r1, r3
  asr r2, r1, #31
  ldr r3, [fp, #-24]
  mul r0, r1, r3
  ldr r3, [fp, #-28]
  mul ip, r2, r3
  add r0, r0, ip
  ldr ip, [fp, #-28]
  umull r3, r4, ip, r1
  add r2, r0, r4
  mov r4, r2
  str r3, [fp, #-28]
  str r4, [fp, #-24]
  str r3, [fp, #-28]
  str r4, [fp, #-24]
  ldr r3, [fp, #-16]
  add r3, r3, #1
  str r3, [fp, #-16]
  b .L3
.L2:
  sub r3, fp, #28
  ldmia r3, {r2-r3}
  ldr r1, [fp, #-32]
  ldr r0, .L5
  bl printf
  mov r3, #0
  mov r0, r3
  sub sp, fp, #8
  pop {r4, fp, lr}
  bx lr
.L5:
  .word .LC0