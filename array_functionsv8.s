sumArray(int, double*):
  sub sp, sp, #48
  str w0, [sp, 12]
  str x1, [sp]
  fmov d0, xzr
  str d0, [sp, 40]
  ldr x0, [sp]
  str x0, [sp, 32]
  ldrsw x0, [sp, 12]
  lsl x0, x0, 3
  ldr x1, [sp, 32]
  add x0, x1, x0
  str x0, [sp, 24]
.L3:
  ldr x1, [sp, 32]
  ldr x0, [sp, 24]
  cmp x1, x0
  bcs .L2
  ldr x0, [sp, 32]
  ldr d0, [x0]
  ldr d1, [sp, 40]
  fadd d0, d1, d0
  str d0, [sp, 40]
  ldr x0, [sp, 32]
  add x0, x0, 8
  str x0, [sp, 32]
  b .L3
.L2:
  ldr x0, [sp, 40]
  fmov d0, x0
  add sp, sp, 48
  ret
maxArray(int, double*):
  sub sp, sp, #48
  str w0, [sp, 12]
  str x1, [sp]
  ldr x0, [sp]
  str x0, [sp, 40]
  ldr x0, .LC0
  str x0, [sp, 32]
  ldrsw x0, [sp, 12]
  lsl x0, x0, 3
  ldr x1, [sp, 40]
  add x0, x1, x0
  str x0, [sp, 24]
.L9:
  ldr x1, [sp, 40]
  ldr x0, [sp, 24]
  cmp x1, x0
  bcs .L6
  ldr x0, [sp, 40]
  ldr d1, [x0]
  ldr d0, [sp, 32]
  fcmpe d1, d0
  ble .L7
  ldr x0, [sp, 40]
  ldr x0, [x0]
  str x0, [sp, 32]
.L7:
  ldr x0, [sp, 40]
  add x0, x0, 8
  str x0, [sp, 40]
  b .L9
.L6:
  ldr x0, [sp, 32]
  fmov d0, x0
  add sp, sp, 48
  ret
.LC0:
  .word 0
  .word -1066037248
minArray(int, double*):
  sub sp, sp, #48
  str w0, [sp, 12]
  str x1, [sp]
  ldr x0, [sp]
  str x0, [sp, 40]
  ldr x0, .LC1 [complete object constructor] [complete object constructor]
  str x0, [sp, 32]
  ldrsw x0, [sp, 12]
  lsl x0, x0, 3
  ldr x1, [sp, 40]
  add x0, x1, x0
  str x0, [sp, 24]
.L16:
  ldr x1, [sp, 40]
  ldr x0, [sp, 24]
  cmp x1, x0
  bcs .L13
  ldr x0, [sp, 40]
  ldr d1, [x0]
  ldr d0, [sp, 32]
  fcmpe d1, d0
  bpl .L14
  ldr x0, [sp, 40]
  ldr x0, [x0]
  str x0, [sp, 32]
.L14:
  ldr x0, [sp, 40]
  add x0, x0, 8
  str x0, [sp, 40]
  b .L16
.L13:
  ldr x0, [sp, 32]
  fmov d0, x0
  add sp, sp, 48
  ret
.LC1 [complete object constructor] [complete object constructor]:
  .word 0
  .word 1081446400
findArray(int, double*, double, double):
  sub sp, sp, #64
  str w0, [sp, 28]
  str x1, [sp, 16]
  str d0, [sp, 8]
  str d1, [sp]
  ldr x0, [sp, 16]
  str x0, [sp, 48]
  ldrsw x0, [sp, 28]
  lsl x0, x0, 3
  ldr x1, [sp, 48]
  add x0, x1, x0
  str x0, [sp, 40]
  str wzr, [sp, 60]
.L25:
  ldr w1, [sp, 60]
  ldr w0, [sp, 28]
  cmp w1, w0
  bge .L20
  ldrsw x0, [sp, 60]
  lsl x0, x0, 3
  ldr x1, [sp, 48]
  add x0, x1, x0
  ldr d1, [x0]
  ldr d0, [sp, 8]
  fcmpe d1, d0
  blt .L21
  ldrsw x0, [sp, 60]
  lsl x0, x0, 3
  ldr x1, [sp, 48]
  add x0, x1, x0
  ldr d1, [x0]
  ldr d0, [sp]
  fcmpe d1, d0
  bhi .L21
  ldr w0, [sp, 60]
  b .L24
.L21:
  ldr w0, [sp, 60]
  add w0, w0, 1
  str w0, [sp, 60]
  b .L25
.L20:
  mov w0, -1
.L24:
  add sp, sp, 64
  ret
sortArray(int, double*):
  sub sp, sp, #48
  str w0, [sp, 12]
  str x1, [sp]
  ldr x0, [sp]
  str x0, [sp, 32]
  str wzr, [sp, 44]
.L34:
  ldr w1, [sp, 44]
  ldr w0, [sp, 12]
  cmp w1, w0
  bge .L29
  ldr w0, [sp, 44]
  add w0, w0, 1
  str w0, [sp, 40]
.L33:
  ldr w1, [sp, 40]
  ldr w0, [sp, 12]
  cmp w1, w0
  bge .L30
  ldrsw x0, [sp, 44]
  lsl x0, x0, 3
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr d1, [x0]
  ldrsw x0, [sp, 40]
  lsl x0, x0, 3
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr d0, [x0]
  fcmpe d1, d0
  ble .L31
  ldrsw x0, [sp, 44]
  lsl x0, x0, 3
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr x0, [x0]
  str x0, [sp, 24]
  ldrsw x0, [sp, 44]
  lsl x0, x0, 3
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldrsw x1, [sp, 40]
  lsl x1, x1, 3
  ldr x2, [sp, 32]
  add x1, x2, x1
  ldr x1, [x1]
  str x1, [x0]
  ldrsw x0, [sp, 40]
  lsl x0, x0, 3
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr x1, [sp, 24]
  str x1, [x0]
.L31:
  ldr w0, [sp, 40]
  add w0, w0, 1
  str w0, [sp, 40]
  b .L33
.L30:
  ldr w0, [sp, 44]
  add w0, w0, 1
  str w0, [sp, 44]
  b .L34
.L29:
  mov w0, 0
  add sp, sp, 48
  ret
.LC2 [base object constructor] [base object constructor]:
  .string "%d:%f\n"
printArray(int, double*):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str w0, [x29, 28]
  str x1, [x29, 16]
  ldr x0, [x29, 16]
  str x0, [x29, 32]
  str wzr, [x29, 44]
.L39:
  ldr w1, [x29, 44]
  ldr w0, [x29, 28]
  cmp w1, w0
  bge .L40
  ldrsw x0, [x29, 44]
  lsl x0, x0, 3
  ldr x1, [x29, 32]
  add x0, x1, x0
  ldr d0, [x0]
  adrp x0, .LC2 [base object constructor] [base object constructor]
  add x0, x0, :lo12:.LC2 [base object constructor] [base object constructor]
  ldr w1, [x29, 44]
  bl printf
  ldr w0, [x29, 44]
  add w0, w0, 1
  str w0, [x29, 44]
  b .L39
.L40:
  nop
  ldp x29, x30, [sp], 48
  ret
