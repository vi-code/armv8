llist_init(LinkedList*):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #12
  str r0, [fp, #-8]
  ldr r3, [fp, #-8]
  mov r2, #0
  str r2, [r3]
  nop
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
.LC0:
  .ascii "{EMPTY}\000"
.LC1 [complete object constructor] [complete object constructor]:
  .ascii "%d\000"
.LC2 [base object constructor] [base object constructor]:
  .ascii ", \000"
.LC3 [complete object allocating constructor] [complete object allocating constructor]:
  .ascii "}\000"
llist_print(LinkedList*):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #16
  str r0, [fp, #-16]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  cmp r3, #0
  bne .L3
  ldr r0, .L8
  bl puts
  b .L2
.L3:
  mov r0, #123
  bl putchar
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
.L7:
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L5
  ldr r3, [fp, #-8]
  ldr r3, [r3]
  mov r1, r3
  ldr r0, .L8+4
  bl printf
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L7
  ldr r0, .L8+8
  bl printf
  b .L7
.L5:
  ldr r0, .L8+12
  bl puts
.L2:
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
.L8:
  .word .LC0
  .word .LC1 [complete object constructor] [complete object constructor]
  .word .LC2 [base object constructor] [base object constructor]
  .word .LC3 [complete object allocating constructor] [complete object allocating constructor]
llist_add(LinkedList*, int):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #16
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  mov r0, #8
  bl malloc
  mov r3, r0
  str r3, [fp, #-8]
  ldr r3, [fp, #-8]
  ldr r2, [fp, #-20]
  str r2, [r3]
  ldr r3, [fp, #-16]
  ldr r2, [r3]
  ldr r3, [fp, #-8]
  str r2, [r3, #4]
  ldr r3, [fp, #-16]
  ldr r2, [fp, #-8]
  str r2, [r3]
  nop
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
llist_exists(LinkedList*, int):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #20
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
.L15:
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L12
  ldr r3, [fp, #-8]
  ldr r2, [r3]
  ldr r3, [fp, #-20]
  cmp r2, r3
  bne .L13
  mov r3, #1
  b .L14
.L13:
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L15
.L12:
  mov r3, #0
.L14:
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
llist_remove(LinkedList*, int):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #20
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-12]
.L20:
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L17
  ldr r3, [fp, #-8]
  ldr r2, [r3]
  ldr r3, [fp, #-20]
  cmp r2, r3
  bne .L18
  ldr r3, [fp, #-8]
  ldr r2, [r3, #4]
  ldr r3, [fp, #-12]
  str r2, [r3, #4]
  mov r3, #1
  b .L19
.L18:
  ldr r3, [fp, #-12]
  ldr r3, [r3, #4]
  str r3, [fp, #-12]
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L20
.L17:
  mov r3, #0
.L19:
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
llist_get_ith(LinkedList*, int, int*):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #28
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  str r2, [fp, #-24]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
  mov r3, #0
  str r3, [fp, #-12]
.L26:
  ldr r2, [fp, #-12]
  ldr r3, [fp, #-20]
  cmp r2, r3
  bge .L22
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L23
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L27
.L23:
  mov r3, #0
  b .L25
.L27:
  ldr r3, [fp, #-12]
  add r3, r3, #1
  str r3, [fp, #-12]
  b .L26
.L22:
  ldr r3, [fp, #-8]
  ldr r2, [r3]
  ldr r3, [fp, #-24]
  str r2, [r3]
  mov r3, #1
.L25:
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
llist_remove_ith(LinkedList*, int):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #20
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
  mov r3, #0
  str r3, [fp, #-12]
.L33:
  ldr r3, [fp, #-20]
  sub r2, r3, #1
  ldr r3, [fp, #-12]
  cmp r2, r3
  ble .L29
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L30
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L34
.L30:
  mov r3, #0
  b .L32
.L34:
  ldr r3, [fp, #-12]
  add r3, r3, #1
  str r3, [fp, #-12]
  b .L33
.L29:
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  ldr r2, [r3, #4]
  ldr r3, [fp, #-8]
  str r2, [r3, #4]
  mov r3, #1
.L32:
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
llist_number_elements(LinkedList*):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #20
  str r0, [fp, #-16]
  mov r3, #0
  str r3, [fp, #-8]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-12]
.L37:
  ldr r3, [fp, #-12]
  cmp r3, #0
  beq .L36
  ldr r3, [fp, #-8]
  add r3, r3, #1
  str r3, [fp, #-8]
  ldr r3, [fp, #-12]
  ldr r3, [r3, #4]
  str r3, [fp, #-12]
  b .L37
.L36:
  ldr r3, [fp, #-8]
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
.LC4:
  .ascii "w\000"
.LC5:
  .ascii "%d\012\000"
llist_save(LinkedList*, char*):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #16
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  ldr r1, .L43
  ldr r0, [fp, #-20]
  bl fopen
  mov r3, r0
  str r3, [fp, #-12]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
  ldr r3, [fp, #-12]
  cmp r3, #0
  bne .L40
  mov r3, #0
  b .L41
.L40:
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L42
  ldr r3, [fp, #-8]
  ldr r3, [r3]
  mov r2, r3
  ldr r1, .L43+4
  ldr r0, [fp, #-12]
  bl fprintf
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L40
.L42:
  ldr r0, [fp, #-12]
  bl fclose
  mov r3, #0
.L41:
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
.L43:
  .word .LC4
  .word .LC5
.LC6:
  .ascii "r\000"
llist_read(LinkedList*, char*):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #24
  str r0, [fp, #-24]
  str r1, [fp, #-28]
  ldr r1, .L50
  ldr r0, [fp, #-28]
  bl fopen
  mov r3, r0
  str r3, [fp, #-8]
  ldr r3, [fp, #-24]
  ldr r3, [r3]
  str r3, [fp, #-12]
  ldr r3, [fp, #-8]
  cmp r3, #0
  bne .L46
  mov r3, #0
  b .L49
.L46:
  sub r3, fp, #16
  mov r2, r3
  ldr r1, .L50+4
  ldr r0, [fp, #-8]
  bl fscanf
  mov r3, r0
  cmn r3, #1
  movne r3, #1
  moveq r3, #0
  and r3, r3, #255
  cmp r3, #0
  beq .L48
  ldr r3, [fp, #-16]
  mov r1, r3
  ldr r0, [fp, #-24]
  bl llist_add(LinkedList*, int)
  b .L46
.L48:
  ldr r0, [fp, #-8]
  bl fclose
  mov r3, #1
.L49:
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
.L50:
  .word .LC6
  .word .LC1 [complete object constructor] [complete object constructor]
sortArray(int, int*):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #28
  str r0, [fp, #-24]
  str r1, [fp, #-28]
  ldr r3, [fp, #-28]
  str r3, [fp, #-16]
  mov r3, #0
  str r3, [fp, #-8]
.L57:
  ldr r2, [fp, #-8]
  ldr r3, [fp, #-24]
  cmp r2, r3
  bge .L53
  ldr r3, [fp, #-8]
  add r3, r3, #1
  str r3, [fp, #-12]
.L56:
  ldr r2, [fp, #-12]
  ldr r3, [fp, #-24]
  cmp r2, r3
  bge .L54
  ldr r3, [fp, #-8]
  lsl r3, r3, #2
  ldr r2, [fp, #-16]
  add r3, r2, r3
  ldr r2, [r3]
  ldr r3, [fp, #-12]
  lsl r3, r3, #2
  ldr r1, [fp, #-16]
  add r3, r1, r3
  ldr r3, [r3]
  cmp r2, r3
  ble .L55
  ldr r3, [fp, #-8]
  lsl r3, r3, #2
  ldr r2, [fp, #-16]
  add r3, r2, r3
  ldr r3, [r3]
  str r3, [fp, #-20]
  ldr r3, [fp, #-8]
  lsl r3, r3, #2
  ldr r2, [fp, #-16]
  add r3, r2, r3
  ldr r2, [fp, #-12]
  lsl r2, r2, #2
  ldr r1, [fp, #-16]
  add r2, r1, r2
  ldr r2, [r2]
  str r2, [r3]
  ldr r3, [fp, #-12]
  lsl r3, r3, #2
  ldr r2, [fp, #-16]
  add r3, r2, r3
  ldr r2, [fp, #-20]
  str r2, [r3]
.L55:
  ldr r3, [fp, #-12]
  add r3, r3, #1
  str r3, [fp, #-12]
  b .L56
.L54:
  ldr r3, [fp, #-8]
  add r3, r3, #1
  str r3, [fp, #-8]
  b .L57
.L53:
  mov r3, #0
  mov r0, r3
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
llist_sort(LinkedList*, int):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #40
  str r0, [fp, #-40]
  str r1, [fp, #-44]
  ldr r3, [fp, #-40]
  ldr r3, [r3]
  str r3, [fp, #-8]
  ldr r0, [fp, #-40]
  bl llist_number_elements(LinkedList*)
  str r0, [fp, #-24]
  ldr r3, [fp, #-24]
  lsl r3, r3, #2
  mov r0, r3
  bl malloc
  mov r3, r0
  str r3, [fp, #-28]
  ldr r3, [fp, #-28]
  str r3, [fp, #-32]
  ldr r3, [fp, #-28]
  str r3, [fp, #-36]
  mov r3, #0
  str r3, [fp, #-12]
.L61:
  ldr r3, [fp, #-8]
  cmp r3, #0
  beq .L60
  ldr r3, [fp, #-12]
  lsl r3, r3, #2
  ldr r2, [fp, #-32]
  add r3, r2, r3
  ldr r2, [fp, #-8]
  ldr r2, [r2]
  str r2, [r3]
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  ldr r3, [fp, #-12]
  add r3, r3, #1
  str r3, [fp, #-12]
  b .L61
.L60:
  ldr r1, [fp, #-36]
  ldr r0, [fp, #-24]
  bl sortArray(int, int*)
  mov r3, #0
  str r3, [fp, #-16]
  ldr r3, [fp, #-40]
  ldr r3, [r3]
  str r3, [fp, #-20]
  ldr r3, [fp, #-44]
  cmp r3, #1
  bne .L62
.L64:
  ldr r3, [fp, #-20]
  cmp r3, #0
  beq .L66
  ldr r3, [fp, #-16]
  lsl r3, r3, #2
  ldr r2, [fp, #-28]
  add r3, r2, r3
  ldr r2, [r3]
  ldr r3, [fp, #-20]
  str r2, [r3]
  ldr r3, [fp, #-20]
  ldr r3, [r3, #4]
  str r3, [fp, #-20]
  ldr r3, [fp, #-16]
  add r3, r3, #1
  str r3, [fp, #-16]
  b .L64
.L62:
  ldr r3, [fp, #-44]
  cmp r3, #0
  bne .L66
  ldr r3, [fp, #-24]
  sub r3, r3, #1
  str r3, [fp, #-16]
.L65:
  ldr r3, [fp, #-20]
  cmp r3, #0
  beq .L66
  ldr r3, [fp, #-16]
  lsl r3, r3, #2
  ldr r2, [fp, #-28]
  add r3, r2, r3
  ldr r2, [r3]
  ldr r3, [fp, #-20]
  str r2, [r3]
  ldr r3, [fp, #-20]
  ldr r3, [r3, #4]
  str r3, [fp, #-20]
  ldr r3, [fp, #-16]
  sub r3, r3, #1
  str r3, [fp, #-16]
  b .L65
.L66:
  nop
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
llist_remove_first(LinkedList*, int*):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #16
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  cmp r3, #0
  bne .L68
  mov r3, #0
  b .L69
.L68:
  ldr r3, [fp, #-8]
  ldr r2, [r3]
  ldr r3, [fp, #-20]
  str r2, [r3]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  ldr r2, [r3, #4]
  ldr r3, [fp, #-16]
  str r2, [r3]
  ldr r0, [fp, #-8]
  bl free
  mov r3, #1
.L69:
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
llist_remove_last(LinkedList*, int*):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #16
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  cmp r3, #0
  bne .L71
  mov r3, #0
  b .L72
.L71:
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  ldr r3, [r3, #4]
  cmp r3, #0
  beq .L73
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L71
.L73:
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  ldr r2, [r3]
  ldr r3, [fp, #-20]
  str r2, [r3]
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  mov r0, r3
  bl free
  ldr r3, [fp, #-8]
  mov r2, #0
  str r2, [r3, #4]
  mov r3, #1
.L72:
  mov r0, r3
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
llist_insert_first(LinkedList*, int):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #8
  str r0, [fp, #-8]
  str r1, [fp, #-12]
  ldr r1, [fp, #-12]
  ldr r0, [fp, #-8]
  bl llist_add(LinkedList*, int)
  nop
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
llist_insert_last(LinkedList*, int):
  push {fp, lr}
  add fp, sp, #4
  sub sp, sp, #16
  str r0, [fp, #-16]
  str r1, [fp, #-20]
  mov r0, #8
  bl malloc
  mov r3, r0
  str r3, [fp, #-12]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  str r3, [fp, #-8]
  ldr r3, [fp, #-16]
  ldr r3, [r3]
  cmp r3, #0
  bne .L76
  ldr r1, [fp, #-20]
  ldr r0, [fp, #-16]
  bl llist_add(LinkedList*, int)
  b .L79
.L76:
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  cmp r3, #0
  beq .L78
  ldr r3, [fp, #-8]
  ldr r3, [r3, #4]
  str r3, [fp, #-8]
  b .L76
.L78:
  ldr r3, [fp, #-8]
  ldr r2, [fp, #-12]
  str r2, [r3, #4]
  ldr r3, [fp, #-12]
  mov r2, #0
  str r2, [r3, #4]
  ldr r3, [fp, #-12]
  ldr r2, [fp, #-20]
  str r2, [r3]
.L79:
  nop
  sub sp, fp, #4
  pop {fp, lr}
  bx lr
llist_clear(LinkedList*):
  str fp, [sp, #-4]!
  add fp, sp, #0
  sub sp, sp, #12
  str r0, [fp, #-8]
  ldr r3, [fp, #-8]
  mov r2, #0
  str r2, [r3]
  nop
  add sp, fp, #0
  ldr fp, [sp], #4
  bx lr
