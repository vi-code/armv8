isLittleEndian():
  sub sp, sp, #16
  mov w0, 5
  str w0, [sp, 4]
  add x0, sp, 4
  str x0, [sp, 8]
  ldr x0, [sp, 8]
  ldrb w0, [x0]
  cmp w0, 5
  bne .L2
  mov w0, 1
  b .L4
.L2:
  mov w0, 0
.L4:
  add sp, sp, 16
  ret
.LC0:
  .string "Machine is Little Endian"
.LC1 [complete object constructor] [complete object constructor]:
  .string "Machine is Big Endian"
main:
  stp x29, x30, [sp, -16]!
  add x29, sp, 0
  bl isLittleEndian()
  cmp w0, wzr
  cset w0, ne
  uxtb w0, w0
  cmp w0, wzr
  beq .L6
  adrp x0, .LC0
  add x0, x0, :lo12:.LC0
  bl puts
  b .L7
.L6:
  adrp x0, .LC1 [complete object constructor] [complete object constructor]
  add x0, x0, :lo12:.LC1 [complete object constructor] [complete object constructor]
  bl puts
.L7:
  mov w0, 0
  ldp x29, x30, [sp], 16
  ret
