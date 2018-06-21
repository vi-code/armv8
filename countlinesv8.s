.LC0:
  .string "Program that counts lines."
.LC1 [complete object constructor] [complete object constructor]:
  .string "r"
.LC2 [base object constructor] [base object constructor]:
  .string "Total lines: %d\n"
main:
  stp x29, x30, [sp, -64]!
  add x29, sp, 0
  str w0, [x29, 28]
  str x1, [x29, 16]
  str wzr, [x29, 60]
  adrp x0, .LC0
  add x0, x0, :lo12:.LC0
  bl puts
  ldr x0, [x29, 16]
  ldr x0, [x0, 8]
  str x0, [x29, 48]
  adrp x0, .LC1 [complete object constructor] [complete object constructor]
  add x0, x0, :lo12:.LC1 [complete object constructor] [complete object constructor]
  mov x1, x0
  ldr x0, [x29, 48]
  bl fopen
  str x0, [x29, 40]
.L4:
  ldr x0, [x29, 40]
  bl fgetc
  str w0, [x29, 36]
  ldr w0, [x29, 36]
  cmn w0, #1
  cset w0, ne
  uxtb w0, w0
  cmp w0, wzr
  beq .L2
  ldr w0, [x29, 36]
  cmp w0, 10
  bne .L4
  ldr w0, [x29, 60]
  add w0, w0, 1
  str w0, [x29, 60]
  b .L4
.L2:
  adrp x0, .LC2 [base object constructor] [base object constructor]
  add x0, x0, :lo12:.LC2 [base object constructor] [base object constructor]
  ldr w1, [x29, 60]
  bl printf
  ldr x0, [x29, 40]
  bl fclose
  mov w0, 0
  bl exit
