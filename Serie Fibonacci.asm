.data
prompt1: .asciiz "Ingrese el indice de secuencia: \n"
prompt2: .asciiz "El valor de Fibonnaci es:\n"
message: .asciiz "El valor de Fibonnaci es:\n0"

.text

# Proposito: Imprimir cadena prompt1 y leer entero
li $v0, 4
la $a0, prompt1
syscall
li $v0, 5
syscall

beq $v0, 0, semejanteaCero

# Proposito: Llamar serie Fibonacci 
move $a0, $v0
jal fibonacci
move $a1, $v0 # el valor de retorno es almacenado en la posición a1

# Proposito: Imprimir cadena prompt2
li $v0, 4
la $a0, prompt2
syscall

# Proposito: Imprimir el resultado
li $v0, 1
move $a0, $a1
syscall

# Proposito: Salida de código
li $v0, 10
syscall



## Proposito: Función int fibonacci (int n)
fibonacci:
# Primera Parte_Prologo
addi $sp, $sp, -12
sw $ra, 8($sp)
sw $s0, 4($sp)
sw $s1, 0($sp)
move $s0, $a0
li $v0, 1 # Valor devuelto para la condición terminal
ble $s0, 0x2, salidaFibonacci # Comprobar el estado del terminal
addi $a0, $s0, -1 # Establecer args para la llamada recursiva a f(n-1)
jal fibonacci
move $s1, $v0 # Almacenar el resultado de f(n-1) to s1
addi $a0, $s0, -2 # Establecer args para la llamada recursiva a f(n-2)
jal fibonacci
add $v0, $s1, $v0 # Sumarle el resultado de f(n-1)
salidaFibonacci:
# Segunda Parte_Epilogo
lw $ra, 8($sp)
lw $s0, 4($sp)
lw $s1, 0($sp)
addi $sp, $sp, 12
jr $ra
##Proposito: Fin de la función Fibonacci

semejanteaCero:
li $v0, 4
la $a0, message
syscall
