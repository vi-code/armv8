.LC0:
  .ascii "Hello World\000"
helloworld():
  push {fp, lr}
  add fp, sp, #4
  ldr r0, .L3
  bl puts
  mov r3, #0
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
.L3:
  .word .LC0