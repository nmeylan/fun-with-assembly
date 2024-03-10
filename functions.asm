; stack: buffer, filename
readfile:
  mov rdi, rax
  mov rsi, 0
  mov rax, 2 ; sys_open
  syscall

  mov rdi, rax ; passing fd into sys_read arg
  mov rsi, rbx
  mov rdx, 128
  mov rax, 0 ;sys_read
  syscall
  ret
exit:
  mov rax, 0x3c
  mov rdi, 1
  syscall

