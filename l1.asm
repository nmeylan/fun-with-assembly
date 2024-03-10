%include 'functions.asm'

SECTION .data
msg     db      'Hello World!', 0ah     ; assign msg variable with your message string
filename db 'hello.txt'

SECTION .bss
buffer resb 128

SECTION .text
global  _start

 
_start:
  mov rax, filename
  mov rbx, buffer
  call readfile

  mov     rdx, rax ; only display bytes read and not full buffer
  mov     rsi, buffer
  mov     rdi, 1 ;stdout
  mov     rax, 1 ;sys_write
  syscall

  call exit
