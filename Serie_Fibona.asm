.data
newline: .asciiz "\n"
result: .asciiz "Serie Fibonacci: \n"
Ques: .ascii "Cuantos quieres que imprima la serie?: "

.text
.globl main

main:
    # Inicializar variables
    li $t0, 0         # Número actual
    li $t1, 1         # Siguiente número
    
    # Muestra el mensaje Ques
    li $v0, 4	
    la $a0, Ques      
    syscall 
    
    # Se ingresa hasta que limite quiere que imprima la serie
    li $v0, 5
    syscall
    move $t2, $v0        # Límite de la serie (cambia según necesites)

    # Imprimir mensaje inicial
    li $v0, 4
    la $a0, result
    syscall

loop:
    # Imprimir el número actual
    li $v0, 1
    move $a0, $t0
    syscall

    # Imprimir un salto de línea
    li $v0, 4
    la $a0, newline
    syscall

    # Calcular el siguiente número de Fibonacci
    add $t3, $t0, $t1   # $t3 = $t0 + $t1
    move $t0, $t1       # $t0 = $t1
    move $t1, $t3       # $t1 = $t3

    # Decrementar el contador y verificar si alcanzamos el límite
    subi $t2, $t2, 1
    bnez $t2, loop

    # Terminar el programa
    li $v0, 10
    syscall
