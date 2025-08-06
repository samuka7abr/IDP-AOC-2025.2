.section .data
msg:
    .asciz "Hello, RISC-V!\n"

.section .text
.global _start

_start:
    # write(stdout, msg, len)
    li a7, 64         # syscall write
    li a0, 1          # file descriptor: stdout
    la a1, msg        # endereço da mensagem
    li a2, 14         # tamanho da string
    ecall

    # exit(0)
    li a7, 93         # syscall exit
    li a0, 0
    ecall
