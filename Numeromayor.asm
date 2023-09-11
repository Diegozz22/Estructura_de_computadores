.data
    pra1: .asciiz "Ingresa los números para encontrar el mayor. \n"
    pra2: .asciiz "Ingresa el primer número: "
    pra3: .asciiz "Ingresa el segundo número: "
    pra4: .asciiz "Ingresa el tercer número: "
    pra5: .asciiz "El número mayor es: "
    pra6: .asciiz "\n Existen números iguales. \n"
    pra7: .asciiz "Ingresa números diferentes. \n"
    
    lineN: .asciiz "\n"  # Salto de línea

.text 
.globl main

main:
    # Muestra el mensaje de entrada pra1
    li $v0, 4
    la $a0, pra1
    syscall

    loop:
        # Muestra el mensaje de entrada pra2
        li $v0, 4
        la $a0, pra2
        syscall  

        # Lee el primer número entero
        li $v0, 5
        syscall
        move $t0, $v0  # Almacena el primer número en $t0

        # Muestra el mensaje de entrada pra3
        li $v0, 4
        la $a0, pra3
        syscall

        # Lee el segundo número entero
        li $v0, 5
        syscall
        move $t1, $v0
        
        # Muestra el mensaje de entrada pra4
        li $v0, 4
        la $a0, pra4
        syscall
        
        # Lee el tercer número entero
        li $v0, 5
        syscall
        move $t2, $v0

        # Compara los tres números para encontrar si son iguales
        beq $t0, $t1, SonIguales
        beq $t0, $t2, SonIguales
        beq $t1, $t2, SonIguales

        # Encuentra el número mayor
        move $t3, $t0
        bgt $t1, $t3, MayorT1
        bgt $t2, $t3, MayorT2
        j fin

    MayorT1:
        move $t3, $t1
        bgt $t2, $t3, MayorT2
        j fin

    MayorT2:
        move $t3, $t2
        j fin

    SonIguales:
        # Imprime el mensaje para números iguales
        li $v0, 4
        la $a0, pra6
        syscall
        
        li $v0, 4
        la $a0, pra7
        syscall
        j loop

    fin:
        # Imprime el mensaje de respuesta pra5
        li $v0, 4
        la $a0, pra5
        syscall  

        # Imprime el número mayor
        li $v0, 1
        move $a0, $t3
        syscall

        # Termina el programa
        li $v0, 10
        syscall

