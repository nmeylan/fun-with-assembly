SECTION .data
msg     db      'Hello World!', 0ah     ; assign msg variable with your message string
filename db 'hello.txt'

SECTION .bss
buffer resb 128

SECTION .text
global  _start

 
_start:
  mov rdi,filename
  mov rsi, 0
  mov rax, 2 ; sys_open
  syscall

  mov rdi, rax ; passing fd into sys_read arg
  mov rsi, buffer
  mov rdx, 128
  mov rax, 0 ;sys_read
  syscall


  mov     rdx, rax ; only display bytes read and not full buffer
  mov     rsi, buffer
  mov     rdi, 1 ;stdout
  mov     rax, 1 ;sys_write
  syscall




  ; exit
  mov rax, 0x3c
  mov rdi, 1
  syscall
