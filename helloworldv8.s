.LC0:
  .string "Hello World"
helloworld():
  stp x29, x30, [sp, -16]!
  add x29, sp, 0
  adrp x0, .LC0
  add x0, x0, :lo12:.LC0
  bl puts
  mov w0, 0
  ldp x29, x30, [sp], 16
  ret