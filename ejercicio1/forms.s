.equ SCREEN_WIDTH, 640
.equ SCREEN_HEIGH, 480
     
move_forward:
    mov x13, SCREEN_WIDTH 
    sub x12, x13, x11
    lsl x12, x12, #2
    add x0, x0, x12 
    ret 
move_to_pixel: 
    mov x12, SCREEN_WIDTH
    mov x0, x20     
    mul x11, x2, x12
    add x11, x11, x1  
    lsl x11, x11, #2 
    add x0, x0, x11 
    ret 
draw_line:
    mov x12, x11 
loop_line:
    stur w10, [x0]           
    add x0, x0, #4           
    sub x12, x12, #1         
    cbnz x12, loop_line 
	ret

draw_rectangle:
    stp X29, X30, [SP, #-16]!
	bl move_to_pixel
    mov x11, x3 
    mov x5, x4 
loop_rectangle:
    bl draw_line
    bl move_forward
    sub x5, x5, #1
    cbnz x5, loop_rectangle
    ldp X29, X30, [SP], #16
	ret
	
dibujar_circulo:
    // Función para dibujar un círculo en un framebuffer
    // x1: coordenada x del centro del círculo
    // x2: coordenada y del centro del círculo
    // x3: radio del círculo
    // x10: color del círculo
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Cargar parámetros en registros
    mov x0, x20 
    mov x5, x1         // Coord x del centro
    mov x6, x2         // Coord y del centro
    mov x7, x3         // Radio

    // Calcular los límites del círculo
    sub x8, x5, x7     // x_min
    add x9, x5, x7     // x_max
    sub x11, x6, x7    // y_min
    add x12, x6, x7    // y_max

    // Cuadrado del radio para comparaciones
    mul x13, x7, x7 

    // Iterar sobre el área del cuadrado que contiene el círculo
    mov x14, x11      
ciclo_y:
    cmp x14, x12      
    bgt fin_y
    mov x15, x8       
ciclo_x:
    cmp x15, x9       
    bgt fin_x

    // Calcular (x - centro_x)^2 + (y - centro_y)^2
    sub x16, x15, x5
    mul x16, x16, x16 // (x - centro_x)^2
    sub x17, x14, x6
    mul x17, x17, x17 // (y - centro_y)^2
    add x18, x16, x17 // (x - centro_x)^2 + (y - centro_y)^2

    // Comprobar si está dentro del círculo
    cmp x18, x13    
    bgt fuera_del_circulo
    // Dibujar el píxel
    mov x21, #SCREEN_WIDTH
    mul x19, x14, x21   
    add x19, x19, x15 
    lsl x19, x19, #2    // Multiplico por 4 ya que son 32bits
    str w10, [x0, x19]  
fuera_del_circulo:
    add x15, x15, #1  // Incrementar x
    b ciclo_x
fin_x:
    add x14, x14, #1  // Incrementar y
    b ciclo_y
fin_y:
    ldp x29, x30, [sp], #16
    ret
    
    draw_triangle:
    // Parametros:
    // x10 - Color
    // x4  - Cuadrante (1, 2, 3, 4)
    // x3  - Lado
    // x2  - Y posición
    // x1  - X posición
    stp X29, X30, [SP, #-16]!
	bl move_to_pixel
    // Este valor entra si x4 es 1
    mov x5, #1
    mov x6, #0
    mov x7, #1
    sub x11, x4, #1
    cbz x11, start_triangle
    // Este valor entra si x4 es 2
    mov x6, #1
    mov x7, #0
    sub x11, x4, #2
    cbz x11, start_triangle
    // Este valor entra si x4 es 3
    mov x5, x3
    mov x6, #-1
    mov x7, #0
    sub x11, x4, #3
    cbz x11, start_triangle
    // Este valor entra si x4 no es 1, 2 ni 3
    mov x6, #0
    mov x7, #-1
start_triangle:
    mov x11, x5
    mov x5, x3
loop_triangle:
    // Dibujar triángulo
    bl draw_line
    add x11, x11, x7
    bl move_forward
    add x11, x11, x6
    sub x5, x5, #1
    cbnz x5, loop_triangle
    ldp X29, X30, [SP], #16
	ret // FINAL DE DRAW_TRIANGLE
dibujar_estrella: 
//Función para dibujar estrellas en el cielo
 stp X29, X30, [SP, #-16]!
     bl dibujar_circulo
     add x1,x1,#2
     sub x2,x2,#80
     bl dibujar_circulo
     add x1,x1,#15
     sub x2,x2,#70
     bl dibujar_circulo
     add x1,x1,#25
     sub x2,x2,#5
     bl dibujar_circulo
     add x1,x1,#90
     sub x2,x2,#8
     bl dibujar_circulo
     add x1,x1,#40
     sub x2,x2,#8
     bl dibujar_circulo
     add x1,x1,#4
     add x2,x2,#90
     bl dibujar_circulo
     sub x1,x1,#20
     add x2,x2,#5
     bl dibujar_circulo
     ldp X29, X30, [SP], #16
     ret








