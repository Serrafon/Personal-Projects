.data
prompt: .asciiz "Por favor, Ingrese un número:\n" # Define una cadena
min: .word 225000 # Define una variable de palabra entera para almacenar el número más pequeño
mensaje: .asciiz "El número menor es:\n" # Define una cadena

.text # Contiene el código
.globl main # Hace la función visbile
main:
    #Proposito: Leer el primer número
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, prompt # Carga la dirección de la cadena prompt en el registro $a0
    syscall # Realiza una llamada al sistema
    li $v0, 5 # Carga el valor 5 en el registro $v0
    syscall 
    sw $v0, min # Almacena el número leído del usuario en la variable

    #Proposito: Leer el segundo número
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, prompt # Carga la dirección de la cadena prompt en el registro $a0
    syscall 
    li $v0, 5 # Carga el valor 5 en el registro $v0
    syscall
    lw $t0, min # Carga el valor de la variable min en el registro $t0
    blt $v0, $t0, updateMin1 # Si el número leído del usuario es menor que el valor actual de variable
    j skipUpdate1 # Si el número leído del usuario no es menor que variable, saltar

#Proposito: Actualizar si es necesario el número Menor
updateMin1:
    sw $v0, min # Almacena el número leído del usuario en la variable

skipUpdate1:
    # Proposito: Leer el tercer número
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, prompt # Carga la dirección de la cadena prompt en el registro $a0
    syscall 
    li $v0, 5 # Carga el valor 5 en el registro $v0
    syscall
    lw $t0, min # Carga el valor de la variable en el registro $t0
    blt $v0, $t0, updateMin2 # Si el número leído del usuario es menor que el valor actual de variable
    j skipUpdate2 # Si el número leído del usuario no es menor que variable, saltar
#Proposito: Actualizar de ser necesario el número Menor
updateMin2:
    sw $v0, min # Almacena el número leído del usuario en la variable

skipUpdate2:
    # Proposito: Imprimir el mensaje
    li $v0, 4 # Carga el valor 4 en el registro $v0
    la $a0, mensaje # Carga la dirección de la cadena mensaje en el registro $a0
    syscall

    # Proposito: Imprimir el número menor
    li $v0, 1 # Carga el valor 1 en el registro $v0
    lw $a0, min # Carga el valor de la variable min en el registro $a0
    syscall

    # Proposito: Salir del código
    li $v0, 10 # Carga el valor 10 en el registro $v0
    syscall # Realiza una llamada al sistema
