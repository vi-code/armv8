sumArray(int, double*):
  push {r4, fp, lr}
  add fp, sp, #8
  sub sp, sp, #28
  str r0, [fp, #-32]
  str r1, [fp, #-36]
  mov r3, #0
  mov r4, #0
  str r3, [fp, #-20]
  str r4, [fp, #-16]
  ldr r3, [fp, #-36]
  str r3, [fp, #-24]
  ldr r3, [fp, #-32]
  lsl r3, r3, #3
  ldr r2, [fp, #-24]
  add r3, r2, r3
  str r3, [fp, #-28]
.L3:
  ldr r2, [fp, #-24]
  ldr r3, [fp, #-28]
  cmp r2, r3
  bcs .L2
  ldr r3, [fp, #-24]
  ldmia r3, {r3-r4}
  mov r2, r3
  mov r3, r4
  sub r1, fp, #20
  ldmia r1, {r0-r1}
  bl __aeabi_dadd
  mov r3, r0
  mov r4, r1
  str r3, [fp, #-20]
  str r4, [fp, #-16]
  ldr r3, [fp, #-24]
  add r3, r3, #8
  str r3, [fp, #-24]
  b .L3
.L2:
  sub r4, fp, #20
  ldmia r4, {r3-r4}
  mov r0, r3
  mov r1, r4
  sub sp, fp, #8
  pop {r4, fp, lr}
  bx lr
maxArray(int, double*):
  push {r4, fp, lr}
  add fp, sp, #8
  sub sp, sp, #36
  str r0, [fp, #-40]
  str r1, [fp, #-44]
  ldr r3, [fp, #-44]
  str r3, [fp, #-16]
  mov r3, #0
  ldr r4, .L12
  str r3, [fp, #-28]
  str r4, [fp, #-24]
  ldr r3, [fp, #-40]
  lsl r3, r3, #3
  ldr r2, [fp, #-16]
  add r3, r2, r3
  str r3, [fp, #-32]
.L9:
  ldr r2, [fp, #-16]
  ldr r3, [fp, #-32]
  cmp r2, r3
  bcs .L6
  ldr r3, [fp, #-16]
  ldmia r3, {r0-r1}
  sub r3, fp, #28
  ldmia r3, {r2-r3}
  bl __aeabi_dcmpgt
  mov r3, r0
  cmp r3, #0
  beq .L7
  ldr r3, [fp, #-16]
  ldmia r3, {r3-r4}
  str r3, [fp, #-28]
  str r4, [fp, #-24]
.L7:
  ldr r3, [fp, #-16]
  add r3, r3, #8
  str r3, [fp, #-16]
  b .L9
.L6:
  sub r4, fp, #28
  ldmia r4, {r3-r4}
  mov r0, r3
  mov r1, r4
  sub sp, fp, #8
  pop {r4, fp, lr}
  bx lr
.L12:
  .word -1066037248
minArray(int, double*):
  push {r4, fp, lr}
  add fp, sp, #8
  sub sp, sp, #36
  str r0, [fp, #-40]
  str r1, [fp, #-44]
  ldr r3, [fp, #-44]
  str r3, [fp, #-16]
  mov r3, #0
  ldr r4, .L21
  str r3, [fp, #-28]
  str r4, [fp, #-24]
  ldr r3, [fp, #-40]
  lsl r3, r3, #3
  ldr r2, [fp, #-16]
  add r3, r2, r3
  str r3, [fp, #-32]
.L18:
  ldr r2, [fp, #-16]
  ldr r3, [fp, #-32]
  cmp r2, r3
  bcs .L15
  ldr r3, [fp, #-16]
  ldmia r3, {r0-r1}
  sub r3, fp, #28
  ldmia r3, {r2-r3}
  bl __aeabi_dcmplt
  mov r3, r0
  cmp r3, #0
  beq .L16
  ldr r3, [fp, #-16]
  ldmia r3, {r3-r4}
  str r3, [fp, #-28]
  str r4, [fp, #-24]
.L16:
  ldr r3, [fp, #-16]
  add r3, r3, #8
  str r3, [fp, #-16]
  b .L18
.L15:
  sub r4, fp, #28
  ldmia r4, {r3-r4}
  mov r0, r3
  mov r1, r4
  sub sp, fp, #8
  pop {r4, fp, lr}
  bx lr
.L21:
  .word 1081446400
findArray(int, double*, double, double):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #32
  str r0, [fp, #-24]
  str r1, [fp, #-28]
  str r2, [fp, #-36]
  str r3, [fp, #-32]
  ldr r3, [fp, #-28]
  str r3, [fp, #-12]
  ldr r3, [fp, #-24]
  lsl r3, r3, #3
  ldr r2, [fp, #-12]
  add r3, r2, r3
  str r3, [fp, #-16]
  mov r3, #0
  str r3, [fp, #-8]
.L29:
  ldr r2, [fp, #-8]
  ldr r3, [fp, #-24]
  cmp r2, r3
  bge .L24
  ldr r3, [fp, #-8]
  lsl r3, r3, #3
  ldr r2, [fp, #-12]
  add r3, r2, r3
  ldmia r3, {r0-r1}
  sub r3, fp, #36
  ldmia r3, {r2-r3}
  bl __aeabi_dcmpge
  mov r3, r0
  cmp r3, #0
  beq .L25
  ldr r3, [fp, #-8]
  lsl r3, r3, #3
  ldr r2, [fp, #-12]
  add r3, r2, r3
  ldmia r3, {r0-r1}
  ldmib fp, {r2-r3}
  bl __aeabi_dcmple
  mov r3, r0
  cmp r3, #0
  beq .L25
  ldr r3, [fp, #-8]
  b .L28
.L25:
  ldr r3, [fp, #-8]
  add r3, r3, #1
  str r3, [fp, #-8]
  b .L29
.L24:
  mvn r3, #0
.L28:
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
sortArray(int, double*):
  push {r4, fp, lr}
  add fp, sp, #8
  sub sp, sp, #36
  str r0, [fp, #-40]
  str r1, [fp, #-44]
  ldr r3, [fp, #-44]
  str r3, [fp, #-24]
  mov r3, #0
  str r3, [fp, #-16]
.L38:
  ldr r2, [fp, #-16]
  ldr r3, [fp, #-40]
  cmp r2, r3
  bge .L33
  ldr r3, [fp, #-16]
  add r3, r3, #1
  str r3, [fp, #-20]
.L37:
  ldr r2, [fp, #-20]
  ldr r3, [fp, #-40]
  cmp r2, r3
  bge .L34
  ldr r3, [fp, #-16]
  lsl r3, r3, #3
  ldr r2, [fp, #-24]
  add r3, r2, r3
  ldmia r3, {r0-r1}
  ldr r3, [fp, #-20]
  lsl r3, r3, #3
  ldr r2, [fp, #-24]
  add r3, r2, r3
  ldmia r3, {r3-r4}
  mov r2, r3
  mov r3, r4
  bl __aeabi_dcmpgt
  mov r3, r0
  cmp r3, #0
  beq .L35
  ldr r3, [fp, #-16]
  lsl r3, r3, #3
  ldr r2, [fp, #-24]
  add r3, r2, r3
  ldmia r3, {r3-r4}
  str r3, [fp, #-36]
  str r4, [fp, #-32]
  ldr r3, [fp, #-16]
  lsl r3, r3, #3
  ldr r2, [fp, #-24]
  add r2, r2, r3
  ldr r3, [fp, #-20]
  lsl r3, r3, #3
  ldr r1, [fp, #-24]
  add r3, r1, r3
  ldmia r3, {r3-r4}
  stm r2, {r3-r4}
  ldr r3, [fp, #-20]
  lsl r3, r3, #3
  ldr r2, [fp, #-24]
  add r2, r2, r3
  sub r4, fp, #36
  ldmia r4, {r3-r4}
  stm r2, {r3-r4}
.L35:
  ldr r3, [fp, #-20]
  add r3, r3, #1
  str r3, [fp, #-20]
  b .L37
.L34:
  ldr r3, [fp, #-16]
  add r3, r3, #1
  str r3, [fp, #-16]
  b .L38
.L33:
  mov r3, #0
  mov r0, r3
  sub sp, fp, #8
  pop {r4, fp, lr}
  bx lr
.LC0:
  .ascii "%d:%f\012\000"
printArray(int, double*):
  push {r4, fp, lr}
  add fp, sp, #8
  sub sp, sp, #20
  str r0, [fp, #-24]
  str r1, [fp, #-28]
  ldr r3, [fp, #-28]
  str r3, [fp, #-20]
  mov r3, #0
  str r3, [fp, #-16]
.L43:
  ldr r2, [fp, #-16]
  ldr r3, [fp, #-24]
  cmp r2, r3
  bge .L44
  ldr r3, [fp, #-16]
  lsl r3, r3, #3
  ldr r2, [fp, #-20]
  add r3, r2, r3
  ldmia r3, {r3-r4}
  mov r2, r3
  mov r3, r4
  ldr r1, [fp, #-16]
  ldr r0, .L45
  bl printf
  ldr r3, [fp, #-16]
  add r3, r3, #1
  str r3, [fp, #-16]
  b .L43
.L44:
  nop
  sub sp, fp, #8
  pop {r4, fp, lr}
  bx lr
.L45:
  .word .LC0
