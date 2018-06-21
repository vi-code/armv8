llist_init(LinkedList*):
  sub sp, sp, #16
  str x0, [sp, 8]
  ldr x0, [sp, 8]
  str xzr, [x0]
  nop
  add sp, sp, 16
  ret
.LC0:
  .string "{EMPTY}"
.LC1 [complete object constructor] [complete object constructor]:
  .string "%d"
.LC2 [base object constructor] [base object constructor]:
  .string ", "
.LC3 [complete object allocating constructor] [complete object allocating constructor]:
  .string "}"
llist_print(LinkedList*):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str x0, [x29, 24]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  cmp x0, xzr
  bne .L3
  adrp x0, .LC0
  add x0, x0, :lo12:.LC0
  bl puts
  b .L2
.L3:
  mov w0, 123
  bl putchar
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 40]
.L7:
  ldr x0, [x29, 40]
  cmp x0, xzr
  beq .L5
  ldr x0, [x29, 40]
  ldr w1, [x0]
  adrp x0, .LC1 [complete object constructor] [complete object constructor]
  add x0, x0, :lo12:.LC1 [complete object constructor] [complete object constructor]
  bl printf
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  str x0, [x29, 40]
  ldr x0, [x29, 40]
  cmp x0, xzr
  beq .L7
  adrp x0, .LC2 [base object constructor] [base object constructor]
  add x0, x0, :lo12:.LC2 [base object constructor] [base object constructor]
  bl printf
  b .L7
.L5:
  adrp x0, .LC3 [complete object allocating constructor] [complete object allocating constructor]
  add x0, x0, :lo12:.LC3 [complete object allocating constructor] [complete object allocating constructor]
  bl puts
.L2:
  ldp x29, x30, [sp], 48
  ret
llist_add(LinkedList*, int):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str x0, [x29, 24]
  str w1, [x29, 20]
  mov x0, 16
  bl malloc
  str x0, [x29, 40]
  ldr x0, [x29, 40]
  ldr w1, [x29, 20]
  str w1, [x0]
  ldr x0, [x29, 24]
  ldr x1, [x0]
  ldr x0, [x29, 40]
  str x1, [x0, 8]
  ldr x0, [x29, 24]
  ldr x1, [x29, 40]
  str x1, [x0]
  nop
  ldp x29, x30, [sp], 48
  ret
llist_exists(LinkedList*, int):
  sub sp, sp, #32
  str x0, [sp, 8]
  str w1, [sp, 4]
  ldr x0, [sp, 8]
  ldr x0, [x0]
  str x0, [sp, 24]
.L13:
  ldr x0, [sp, 24]
  cmp x0, xzr
  beq .L10
  ldr x0, [sp, 24]
  ldr w1, [x0]
  ldr w0, [sp, 4]
  cmp w1, w0
  bne .L11
  mov w0, 1
  b .L12
.L11:
  ldr x0, [sp, 24]
  ldr x0, [x0, 8]
  str x0, [sp, 24]
  b .L13
.L10:
  mov w0, 0
.L12:
  add sp, sp, 32
  ret
llist_remove(LinkedList*, int):
  sub sp, sp, #32
  str x0, [sp, 8]
  str w1, [sp, 4]
  ldr x0, [sp, 8]
  ldr x0, [x0]
  ldr x0, [x0, 8]
  str x0, [sp, 24]
  ldr x0, [sp, 8]
  ldr x0, [x0]
  str x0, [sp, 16]
.L18:
  ldr x0, [sp, 24]
  cmp x0, xzr
  beq .L15
  ldr x0, [sp, 24]
  ldr w1, [x0]
  ldr w0, [sp, 4]
  cmp w1, w0
  bne .L16
  ldr x0, [sp, 24]
  ldr x1, [x0, 8]
  ldr x0, [sp, 16]
  str x1, [x0, 8]
  mov w0, 1
  b .L17
.L16:
  ldr x0, [sp, 16]
  ldr x0, [x0, 8]
  str x0, [sp, 16]
  ldr x0, [sp, 24]
  ldr x0, [x0, 8]
  str x0, [sp, 24]
  b .L18
.L15:
  mov w0, 0
.L17:
  add sp, sp, 32
  ret
llist_get_ith(LinkedList*, int, int*):
  sub sp, sp, #48
  str x0, [sp, 24]
  str w1, [sp, 20]
  str x2, [sp, 8]
  ldr x0, [sp, 24]
  ldr x0, [x0]
  str x0, [sp, 40]
  str wzr, [sp, 36]
.L24:
  ldr w1, [sp, 36]
  ldr w0, [sp, 20]
  cmp w1, w0
  bge .L20
  ldr x0, [sp, 40]
  cmp x0, xzr
  beq .L21
  ldr x0, [sp, 40]
  ldr x0, [x0, 8]
  str x0, [sp, 40]
  b .L25
.L21:
  mov w0, 0
  b .L23
.L25:
  ldr w0, [sp, 36]
  add w0, w0, 1
  str w0, [sp, 36]
  b .L24
.L20:
  ldr x0, [sp, 40]
  ldr w1, [x0]
  ldr x0, [sp, 8]
  str w1, [x0]
  mov w0, 1
.L23:
  add sp, sp, 48
  ret
llist_remove_ith(LinkedList*, int):
  sub sp, sp, #32
  str x0, [sp, 8]
  str w1, [sp, 4]
  ldr x0, [sp, 8]
  ldr x0, [x0]
  str x0, [sp, 24]
  str wzr, [sp, 20]
.L31:
  ldr w0, [sp, 4]
  sub w1, w0, #1
  ldr w0, [sp, 20]
  cmp w1, w0
  ble .L27
  ldr x0, [sp, 24]
  cmp x0, xzr
  beq .L28
  ldr x0, [sp, 24]
  ldr x0, [x0, 8]
  str x0, [sp, 24]
  b .L32
.L28:
  mov w0, 0
  b .L30
.L32:
  ldr w0, [sp, 20]
  add w0, w0, 1
  str w0, [sp, 20]
  b .L31
.L27:
  ldr x0, [sp, 24]
  ldr x0, [x0, 8]
  ldr x1, [x0, 8]
  ldr x0, [sp, 24]
  str x1, [x0, 8]
  mov w0, 1
.L30:
  add sp, sp, 32
  ret
llist_number_elements(LinkedList*):
  sub sp, sp, #32
  str x0, [sp, 8]
  str wzr, [sp, 28]
  ldr x0, [sp, 8]
  ldr x0, [x0]
  str x0, [sp, 16]
.L35:
  ldr x0, [sp, 16]
  cmp x0, xzr
  beq .L34
  ldr w0, [sp, 28]
  add w0, w0, 1
  str w0, [sp, 28]
  ldr x0, [sp, 16]
  ldr x0, [x0, 8]
  str x0, [sp, 16]
  b .L35
.L34:
  ldr w0, [sp, 28]
  add sp, sp, 32
  ret
.LC4:
  .string "w"
.LC5:
  .string "%d\n"
llist_save(LinkedList*, char*):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str x0, [x29, 24]
  str x1, [x29, 16]
  adrp x0, .LC4
  add x0, x0, :lo12:.LC4
  mov x1, x0
  ldr x0, [x29, 16]
  bl fopen
  str x0, [x29, 32]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 40]
  ldr x0, [x29, 32]
  cmp x0, xzr
  bne .L38
  mov w0, 0
  b .L39
.L38:
  ldr x0, [x29, 40]
  cmp x0, xzr
  beq .L40
  ldr x0, [x29, 40]
  ldr w1, [x0]
  adrp x0, .LC5
  add x0, x0, :lo12:.LC5
  mov w2, w1
  mov x1, x0
  ldr x0, [x29, 32]
  bl fprintf
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  str x0, [x29, 40]
  b .L38
.L40:
  ldr x0, [x29, 32]
  bl fclose
  mov w0, 0
.L39:
  ldp x29, x30, [sp], 48
  ret
.LC6:
  .string "r"
llist_read(LinkedList*, char*):
  stp x29, x30, [sp, -64]!
  add x29, sp, 0
  str x0, [x29, 24]
  str x1, [x29, 16]
  adrp x0, .LC6
  add x0, x0, :lo12:.LC6
  mov x1, x0
  ldr x0, [x29, 16]
  bl fopen
  str x0, [x29, 56]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 48]
  ldr x0, [x29, 56]
  cmp x0, xzr
  bne .L42
  mov w0, 0
  b .L45
.L42:
  add x1, x29, 44
  adrp x0, .LC1 [complete object constructor] [complete object constructor]
  add x0, x0, :lo12:.LC1 [complete object constructor] [complete object constructor]
  mov x2, x1
  mov x1, x0
  ldr x0, [x29, 56]
  bl fscanf
  cmn w0, #1
  cset w0, ne
  uxtb w0, w0
  cmp w0, wzr
  beq .L44
  ldr w0, [x29, 44]
  mov w1, w0
  ldr x0, [x29, 24]
  bl llist_add(LinkedList*, int)
  b .L42
.L44:
  ldr x0, [x29, 56]
  bl fclose
  mov w0, 1
.L45:
  ldp x29, x30, [sp], 64
  ret
sortArray(int, int*):
  sub sp, sp, #48
  str w0, [sp, 12]
  str x1, [sp]
  ldr x0, [sp]
  str x0, [sp, 32]
  str wzr, [sp, 44]
.L51:
  ldr w1, [sp, 44]
  ldr w0, [sp, 12]
  cmp w1, w0
  bge .L47
  ldr w0, [sp, 44]
  add w0, w0, 1
  str w0, [sp, 40]
.L50:
  ldr w1, [sp, 40]
  ldr w0, [sp, 12]
  cmp w1, w0
  bge .L48
  ldrsw x0, [sp, 44]
  lsl x0, x0, 2
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr w1, [x0]
  ldrsw x0, [sp, 40]
  lsl x0, x0, 2
  ldr x2, [sp, 32]
  add x0, x2, x0
  ldr w0, [x0]
  cmp w1, w0
  ble .L49
  ldrsw x0, [sp, 44]
  lsl x0, x0, 2
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr w0, [x0]
  str w0, [sp, 28]
  ldrsw x0, [sp, 44]
  lsl x0, x0, 2
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldrsw x1, [sp, 40]
  lsl x1, x1, 2
  ldr x2, [sp, 32]
  add x1, x2, x1
  ldr w1, [x1]
  str w1, [x0]
  ldrsw x0, [sp, 40]
  lsl x0, x0, 2
  ldr x1, [sp, 32]
  add x0, x1, x0
  ldr w1, [sp, 28]
  str w1, [x0]
.L49:
  ldr w0, [sp, 40]
  add w0, w0, 1
  str w0, [sp, 40]
  b .L50
.L48:
  ldr w0, [sp, 44]
  add w0, w0, 1
  str w0, [sp, 44]
  b .L51
.L47:
  mov w0, 0
  add sp, sp, 48
  ret
llist_sort(LinkedList*, int):
  stp x29, x30, [sp, -96]!
  add x29, sp, 0
  str x0, [x29, 24]
  str w1, [x29, 20]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 88]
  ldr x0, [x29, 24]
  bl llist_number_elements(LinkedList*)
  str w0, [x29, 68]
  ldrsw x0, [x29, 68]
  lsl x0, x0, 2
  bl malloc
  str x0, [x29, 56]
  ldr x0, [x29, 56]
  str x0, [x29, 48]
  ldr x0, [x29, 56]
  str x0, [x29, 40]
  str wzr, [x29, 84]
.L55:
  ldr x0, [x29, 88]
  cmp x0, xzr
  beq .L54
  ldrsw x0, [x29, 84]
  lsl x0, x0, 2
  ldr x1, [x29, 48]
  add x0, x1, x0
  ldr x1, [x29, 88]
  ldr w1, [x1]
  str w1, [x0]
  ldr x0, [x29, 88]
  ldr x0, [x0, 8]
  str x0, [x29, 88]
  ldr w0, [x29, 84]
  add w0, w0, 1
  str w0, [x29, 84]
  b .L55
.L54:
  ldr x1, [x29, 40]
  ldr w0, [x29, 68]
  bl sortArray(int, int*)
  str wzr, [x29, 80]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 72]
  ldr w0, [x29, 20]
  cmp w0, 1
  bne .L56
.L58:
  ldr x0, [x29, 72]
  cmp x0, xzr
  beq .L60
  ldrsw x0, [x29, 80]
  lsl x0, x0, 2
  ldr x1, [x29, 56]
  add x0, x1, x0
  ldr w1, [x0]
  ldr x0, [x29, 72]
  str w1, [x0]
  ldr x0, [x29, 72]
  ldr x0, [x0, 8]
  str x0, [x29, 72]
  ldr w0, [x29, 80]
  add w0, w0, 1
  str w0, [x29, 80]
  b .L58
.L56:
  ldr w0, [x29, 20]
  cmp w0, wzr
  bne .L60
  ldr w0, [x29, 68]
  sub w0, w0, #1
  str w0, [x29, 80]
.L59:
  ldr x0, [x29, 72]
  cmp x0, xzr
  beq .L60
  ldrsw x0, [x29, 80]
  lsl x0, x0, 2
  ldr x1, [x29, 56]
  add x0, x1, x0
  ldr w1, [x0]
  ldr x0, [x29, 72]
  str w1, [x0]
  ldr x0, [x29, 72]
  ldr x0, [x0, 8]
  str x0, [x29, 72]
  ldr w0, [x29, 80]
  sub w0, w0, #1
  str w0, [x29, 80]
  b .L59
.L60:
  nop
  ldp x29, x30, [sp], 96
  ret
llist_remove_first(LinkedList*, int*):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str x0, [x29, 24]
  str x1, [x29, 16]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 40]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  cmp x0, xzr
  bne .L62
  mov w0, 0
  b .L63
.L62:
  ldr x0, [x29, 40]
  ldr w1, [x0]
  ldr x0, [x29, 16]
  str w1, [x0]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  ldr x1, [x0, 8]
  ldr x0, [x29, 24]
  str x1, [x0]
  ldr x0, [x29, 40]
  bl free
  mov w0, 1
.L63:
  ldp x29, x30, [sp], 48
  ret
llist_remove_last(LinkedList*, int*):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str x0, [x29, 24]
  str x1, [x29, 16]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 40]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  cmp x0, xzr
  bne .L65
  mov w0, 0
  b .L66
.L65:
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  ldr x0, [x0, 8]
  cmp x0, xzr
  beq .L67
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  str x0, [x29, 40]
  b .L65
.L67:
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  ldr w1, [x0]
  ldr x0, [x29, 16]
  str w1, [x0]
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  bl free
  ldr x0, [x29, 40]
  str xzr, [x0, 8]
  mov w0, 1
.L66:
  ldp x29, x30, [sp], 48
  ret
llist_insert_first(LinkedList*, int):
  stp x29, x30, [sp, -32]!
  add x29, sp, 0
  str x0, [x29, 24]
  str w1, [x29, 20]
  ldr w1, [x29, 20]
  ldr x0, [x29, 24]
  bl llist_add(LinkedList*, int)
  nop
  ldp x29, x30, [sp], 32
  ret
llist_insert_last(LinkedList*, int):
  stp x29, x30, [sp, -48]!
  add x29, sp, 0
  str x0, [x29, 24]
  str w1, [x29, 20]
  mov x0, 16
  bl malloc
  str x0, [x29, 32]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  str x0, [x29, 40]
  ldr x0, [x29, 24]
  ldr x0, [x0]
  cmp x0, xzr
  bne .L70
  ldr w1, [x29, 20]
  ldr x0, [x29, 24]
  bl llist_add(LinkedList*, int)
  b .L73
.L70:
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  cmp x0, xzr
  beq .L72
  ldr x0, [x29, 40]
  ldr x0, [x0, 8]
  str x0, [x29, 40]
  b .L70
.L72:
  ldr x0, [x29, 40]
  ldr x1, [x29, 32]
  str x1, [x0, 8]
  ldr x0, [x29, 32]
  str xzr, [x0, 8]
  ldr x0, [x29, 32]
  ldr w1, [x29, 20]
  str w1, [x0]
.L73:
  nop
  ldp x29, x30, [sp], 48
  ret
llist_clear(LinkedList*):
  sub sp, sp, #16
  str x0, [sp, 8]
  ldr x0, [sp, 8]
  str xzr, [x0]
  nop
  add sp, sp, 16
  ret
