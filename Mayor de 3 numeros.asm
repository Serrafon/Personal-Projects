.data
prompt: .asciiz "Por favor, Digite un número:\n" # Define una cadena
max: .word 0 # Define una variable de palabra entera
message: .asciiz "El número mayor es:\n" # Define una cadena

.text # Contiene el código
.globl main # Hace la función visbile
main: # Etiqueta para la función principal
    # Proposito: Leer el primer número
    li $v0, 4 # Carga el valor 4 en el registro
    la $a0, prompt #  Carga la dirección de la cadena prompt
    syscall # llamada al sistema
    li $v0, 5 # Carga el valor 5 en el registro $v0
    syscall 
    sw $v0, max # Almacena el número leído del usuario en la variable

    # Proposito: Leer el segundo número
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, prompt # Carga la dirección de la cadena prompt en el registro $a0
    syscall 
    li $v0, 5 # Carga el valor 5 en el registro $v0
    syscall
    lw $t0, max # Carga el valor de la variable max en el registro $t0
    bgt $v0, $t0, updateMax1 # Si el número leído del usuario es mayor que el valor actual de variable
    j skipUpdate1 # Posible salto salto a la etiqueta
#Proposito: Actualizar si es necesario el número Mayor
updateMax1:
    sw $v0, max # Almacena el número leído del usuario en la variable max

skipUpdate1:
    # Proposito: Leer el tercer número
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, prompt # Carga la dirección de la cadena prompt en el registro $a0
    syscall
    li $v0, 5 # Carga el valor 5 en el registro $v0
    syscall
    lw $t0, max # Carga el valor de la variable max en el registro $t0
    bgt $v0, $t0, updateMax2 # Si el número leído del usuario es mayor que el valor actual
    j skipUpdate2 # Si el número leído del usuario no es mayor que max salta
#Proposito: Actualizar de ser necesario el número Mayor
updateMax2:
    sw $v0, max # Almacena el número leído del usuario en la variable

skipUpdate2:
    # Proposito: Imprimir el mensaje
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, message #  Carga la dirección de la cadena message en el registro $a0
    syscall

    # Proposito: Imprimir el número mayor
    li $v0, 1 # Carga el valor 1 en el registro $v0
    lw $a0, max # Carga el valor de la variable max en el registro $a0
    syscall

    # Proposito: Salir del código
    li $v0, 10 # Carga el valor 10 en el registro $v0
    syscall
