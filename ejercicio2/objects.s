.equ SCREEN_WIDTH,   640

.equ SCREEN_HEIGHT,  480

.equ BITS_PER_PIXEL, 32

.equ RECTANGLE_HEIGHT, 10  // Altura de los rectángulos para animar el cielo	

.include "forms.s"

		//------------------DIBUJAR LUNA-----------------------

dibujar_luna:

 mov x29, sp

stp X29, X30, [SP, #-16]!

// x1: coordenada x del centro del círculo

    // x2: coordenada y del centro del círculo

    // x3: radio del círculo

    // x10: color del círculo

    

    MOVZ X10, 0xFFFF, LSL 0

    MOVK X10, 0x00FF, LSL 16

	mov x1, x23

	mov x2, x24

	mov x3, x26

bl dibujar_circulo

//Copia de direcciones

 mov x17, x1

 mov x18, x2

    MOVZ X10, 0x0030, LSL 0

    MOVK X10, 0x0800, LSL 16

	add x1, x17, #30

	sub x2, x18, #15

	mov x3, #70

bl dibujar_circulo

ldp X29, X30, [SP], #16

ret

		//------------CIELO ESTRELLADO----------------

cielo_estrellado:

    stp X29, X30, [SP, #-16]! 

    MOVZ X10, 0xFFFF, LSL 0

    MOVK X10, 0x00FF, LSL 16

     mov x1, #5

     mov x2, #350

     mov x3, #1   

     bl dibujar_estrella

     mov x1, #50

     mov x2, #300

     mov x3, #2

     bl dibujar_estrella

     

     mov x1, #150

     mov x2, #220

     mov x3, #2   

     bl dibujar_estrella

     

     mov x1, #200

     mov x2, #180

     mov x3, #2  

     bl dibujar_estrella

     ldp X29, X30, [SP], #16

     ret

     

     //------------------DIBUJO SOL-------------------

     

     dibujar_sol:

     stp X29, X30, [SP, #-16]!

     movz x10, #0x00FF, lsl 16  

	 movk x10, #0xF1AA, lsl 00

     movz x10, #0x00F1, lsl 16  

	 movk x10, #0xC232, lsl 00

     mov x1, x27

	 mov x2, x28

	 mov x3, #75

bl dibujar_circulo


     ldp X29, X30, [SP], #16

     ret

     

     //------------------DIBUJO EDIFICIO-------------------

     

dibujar_edificio:

// Dibujar una línea horizontal de 100 píxeles en la fila 200, empezando desde la columna 100

stp X29, X30, [SP, #-16]!

	// Parametros:

    // x10 - Color

    // x1  - X posición

    // x2  - Y posición

    // x3  - Ancho

    // x4  - Altura

    

    

    //edificio

    

	movz x10, 0x6a, lsl 16

	movk x10, 0x4C47, lsl 00

	mov x1, #265

	mov x2, #120

	mov x3, #375

	mov x4, #640

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //sombra

    movk x10, #0x0000, lsl 00    

	mov x1, #235

	mov x2, #100

	mov x3, #405

    mov x4, #20

	bl draw_rectangle

	movz x10, #0x0027, lsl 16   

    movk x10, #0x1914, lsl 00    

	mov x1, #240

	mov x2, #105

	mov x3, #400

    mov x4, #10

	bl draw_rectangle

	movz x10, #0x0000, lsl 16   //sombra

    movk x10, #0x0000, lsl 00    

	mov x1, #225

	mov x2, #95

	mov x3, #415

    mov x4, #5

    bl draw_rectangle

	movz x10, #0x0000, lsl 16   

    movk x10, #0x0000, lsl 00    

	mov x1, #245

	mov x2, #120

	mov x3, #30

    mov x4, #580

	bl draw_rectangle

	

	movz x10, #0x0027, lsl 16   

    movk x10, #0x1914, lsl 00    

	mov x1, #250

	mov x2, #120

	mov x3, #15

    mov x4, #580

	bl draw_rectangle

	

	//borde superior edificio

	

	movz x10, #0x0000, lsl 16   

    movk x10, #0x0000, lsl 00    

	mov x1, #210

	mov x2, #65

	mov x3, #430

    mov x4, #30

	bl draw_rectangle

	

	

	movz x10, #0x0013, lsl 16   

	movk x10, #0x0C0A, lsl 00      

	mov x1, #215

	mov x2, #70

	mov x3, #425

    mov x4, #20

	bl draw_rectangle

	

	mov x0, x20

	// Parametros:

    // x10 - Color

    // x1  - X posición

    // x2  - Y posición

    // x3  - Ancho

    // x4  - Altura

    

    movz x10, #0x0000, lsl 16   //sombra

    movk x10, #0x0000, lsl 00    

	mov x1, #245

	mov x2, #120

	mov x3, #395

    mov x4, #5

    bl draw_rectangle

    

    //baranda edifico

    

    movz x10, #0x0000, lsl 16   //baranda

    movk x10, #0x0000, lsl 00    

	mov x1, #235

	mov x2, #40

	mov x3, #405

    mov x4, #10

    bl draw_rectangle

    movz x10, #0x0000, lsl 16   //baranda

    movk x10, #0x0000, lsl 00    

	mov x1, #235

	mov x2, #40

	mov x3, #20

    mov x4, #25

    bl draw_rectangle

    

    

    //aires acondicionados

    

    movz x10, #0x0000, lsl 16   //aire1

    movk x10, #0x0000, lsl 00    

	mov x1, #450

	mov x2, #30

	mov x3, #40

    mov x4, #35

    bl draw_rectangle

    movz x10, #0x0000, lsl 16   //aire1

    movk x10, #0x0000, lsl 00    

	mov x1, #500

	mov x2, #20

	mov x3, #70

    mov x4, #45

    bl draw_rectangle

    

    //BORDES VENTANAS

    

    //bordes primera fila

        

    movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #285

	mov x2, #125			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #485

	mov x2, #125			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #385

	mov x2, #125			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #585

	mov x2, #125			

	mov x3, #55

    mov x4, #100

bl draw_rectangle

    //bordes segunda fila

    

    movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #585

	mov x2, #245			

	mov x3, #55

    mov x4, #100

bl draw_rectangle

    movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #385

	mov x2, #245			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

    movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #485

	mov x2, #245			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

    movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #285

	mov x2, #245			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

    

    //bordes tercera fila

    

    movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #285

	mov x2, #365			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #485

	mov x2, #365			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #385

	mov x2, #365			

	mov x3, #82

    mov x4, #100

bl draw_rectangle

	movz x10, #0x0000, lsl 16   //bordes ventanas

    movk x10, #0x0000, lsl 00    

	mov x1, #585

	mov x2, #365			

	mov x3, #55

    mov x4, #100

bl draw_rectangle

    //Primer fila de ventanas

    

	movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #290

	mov x2, #130			

	mov x3, #72

    mov x4, #90

bl draw_rectangle

	movz x10, #0x00FF, lsl 16  // brillo ventana

	movk x10, #0xF1AA, lsl 00   

	mov x1, #290

	mov x2, #190			

	mov x3, #72

    mov x4, #30

bl draw_rectangle  

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #490

	mov x2, #130

	mov x3, #72

    mov x4, #90

bl draw_rectangle

	movz x10, #0x000E, lsl 16  // oscuro ventana

	movk x10, #0x0E0E, lsl 00   

	mov x1, #490

	mov x2, #210			

	mov x3, #72

    mov x4, #10

bl draw_rectangle     

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #390

	mov x2, #130

	mov x3, #72

    mov x4, #90

bl draw_rectangle 

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #590

	mov x2, #130

	mov x3, #50

    mov x4, #90

bl draw_rectangle

    //segunda fila de ventanas

    

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #290

	mov x2, #255

	mov x3, #72

    mov x4, #85

bl draw_rectangle

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #490

	mov x2, #255

	mov x3, #72

    mov x4, #85

bl draw_rectangle

	movz x10, #0x00FF, lsl 16  // brillo ventana

	movk x10, #0xF1AA, lsl 00   

	mov x1, #490

	mov x2, #320			

	mov x3, #72

    mov x4, #20

bl draw_rectangle 

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #390

	mov x2, #255

	mov x3, #72

    mov x4, #85

bl draw_rectangle

	movz x10, #0x000E, lsl 16  // oscuro ventana

	movk x10, #0x0E0E, lsl 00   

	mov x1, #390

	mov x2, #310			

	mov x3, #72

    mov x4, #30

bl draw_rectangle 

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #590

	mov x2, #255

	mov x3, #50

    mov x4, #85

bl draw_rectangle

	//tercera fila de ventanas

	

	movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #290

	mov x2, #375

	mov x3, #72

    mov x4, #85

bl draw_rectangle

	movz x10, #0x00FF, lsl 16  // brillo ventana

	movk x10, #0xF1AA, lsl 00   

	mov x1, #290

	mov x2, #445			

	mov x3, #72

    mov x4, #15

bl draw_rectangle

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #490

	mov x2, #375

	mov x3, #72

    mov x4, #85

bl draw_rectangle

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #390

	mov x2, #375

	mov x3, #72

    mov x4, #85

bl draw_rectangle

	movz x10, #0x00FF, lsl 16  // brillo ventana

	movk x10, #0xF1AA, lsl 00   

	mov x1, #390

	mov x2, #410			

	mov x3, #72

    mov x4, #50

bl draw_rectangle 

    movz x10, #0x2020, lsl 16   

    movk x10, #0x2020, lsl 00    

    movk x10, #0x2020

	mov x1, #590

	mov x2, #375

	mov x3, #50

    mov x4, #85

bl draw_rectangle

	movz x10, #0x000E, lsl 16  // oscuro ventana

	movk x10, #0x0E0E, lsl 00   

	mov x1, #590

	mov x2, #390			

	mov x3, #50

    mov x4, #70

bl draw_rectangle  

    //borde edificio

ldp X29, X30, [SP], #16

ret
//----------------APAGAR VENTANA-------------------
apagar_ventana:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Parámetros:
    // x1: Coordenada x de la ventana
    // x2: Coordenada y de la ventana
    // x3: Ancho de la ventana
    // x4: Altura de la ventana
    // x10: Color oscuro de la ventana

    // Configurar color oscuro
    movz x10, #0x000E, lsl 16
    movk x10, #0x0E0E, lsl 00

    // Dibujar la ventana oscura
    bl draw_rectangle

    // Restaurar el stack y salir
    mov sp, x29
    ldp x29, x30, [sp], #16
    add sp, sp, #16
    ret
    
//----------------PRENDER VENTANA-------------------
brillo_ventana:
    stp x29, x30, [sp, #-16]!
    mov x29, sp

    // Parámetros:
    // x1: Coordenada x de la ventana
    // x2: Coordenada y de la ventana
    // x3: Ancho de la ventana
    // x4: Altura de la ventana
    // x10: Color oscuro de la ventana

    // Configurar brillo
    movz x10, #0x00FF, lsl 16 

	movk x10, #0xF1AA, lsl 00   

    // Dibujar la ventana oscura
    bl draw_rectangle

    // Restaurar el stack y salir
    mov sp, x29
    ldp x29, x30, [sp], #16
    add sp, sp, #16
    ret

    //------------ANIMACION VENTANAS-------------------
animar_ventanas:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
   

    
    // Apagar una ventana específica
    // Coordenadas y tamaño de la ventana a apagar
    mov x1, #290
	mov x2, #150	
	mov x3, #72
    mov x4, #70   
    bl apagar_ventana
    // Apagar una ventana específica
    // Coordenadas y tamaño de la ventana a apagar
  
	mov x1, #290
	mov x2, #385
	mov x3, #72
    mov x4, #75

    // Llamar a la función para apagar la ventana
    bl apagar_ventana
    
    
    mov x1, #490
	mov x2, #405
	mov x3, #72
    mov x4, #55
    bl apagar_ventana
    
    mov x1, #390
	mov x2, #140
	mov x3, #72
    mov x4, #80
    bl brillo_ventana
    
     mov x1, #390
	mov x2, #140
	mov x3, #72
    mov x4, #80
    bl brillo_ventana
    
    mov x1, #290
	mov x2, #275
	mov x3, #72
    mov x4, #65
    bl brillo_ventana

    bl apagar_logo

    // Restaurar el stack y salir
    mov sp, x29
    ldp x29, x30, [sp], #16
    add sp, sp, #16
    ret
			//---------------DIBUJAR PINO----------------------

	

dibujar_pino:

// Coordenadas y parámetros del triángulo inferior

	// Coordenada X del vértice superior del triángulo inferior

	// Coordenada Y del vértice superior del triángulo inferior

	// Lado del triángulo inferior

	// Cuadrante (para un triángulo isósceles en el cuadrante 1)

	stp X29, X30, [SP, #-16]!

    mov x1, 110			// hoja inferior    

    mov x2, 400       

    mov x3, 100       

    mov x4, 1         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    mov x1, 110       // hoja inferior

    mov x2, 400      

    mov x3, 100      

    mov x4, 2         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    

    mov x1, 110        // sombra quinta hoja

    mov x2, 385       

    mov x3, 90       

    mov x4, 1         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    mov x1, 110       // sombra quinta hoja

    mov x2, 385       

    mov x3, 90       

    mov x4, 2         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    

    mov x1, 110        // quinta hoja

    mov x2, 380       

    mov x3, 90       

    mov x4, 1         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    mov x1, 110       // quinta hoja

    mov x2, 380       

    mov x3, 90       

    mov x4, 2         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    

    mov x1, 110        // sombra cuarta hoja

    mov x2, 365       

    mov x3, 80       

    mov x4, 1         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    mov x1, 110       // sombra cuarta hoja

    mov x2, 365       

    mov x3, 80       

    mov x4, 2         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    

    mov x1, 110        // cuarta hoja

    mov x2, 360       

    mov x3, 80       

    mov x4, 1         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    mov x1, 110       // cuarta hoja

    mov x2, 360       

    mov x3, 80       

    mov x4, 2         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    

    mov x1, 110        // sombra tercer hoja

    mov x2, 345       

    mov x3, 70      

    mov x4, 1         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    mov x1, 110       // sombra tercer hoja

    mov x2, 345       

    mov x3, 70       

    mov x4, 2         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    

    mov x1, 110        // tercer hoja

    mov x2, 340       

    mov x3, 70      

    mov x4, 1         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    mov x1, 110       // tercer hoja

    mov x2, 340       

    mov x3, 70       

    mov x4, 2         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    

	mov x1, 110        // sombra segunda hoja

    mov x2, 325       

    mov x3, 60       

    mov x4, 1         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    mov x1, 110       // sombra segunda hoja

    mov x2, 325       

    mov x3, 60       

    mov x4, 2         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

	

	mov x1, 110        // segunda hoja

    mov x2, 320       

    mov x3, 60       

    mov x4, 1         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    mov x1, 110       // segunda hoja

    mov x2, 320       

    mov x3, 60       

    mov x4, 2         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    

    mov x1, 110        // sombra primer hoja

    mov x2, 305      

    mov x3, 50       

    mov x4, 1         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    mov x1, 110       // sombra primer hoja

    mov x2, 305       

    mov x3, 50       

    mov x4, 2         

    movz x10, #0x04, lsl 16   

    movk x10, #0x120B, lsl 00

    bl draw_triangle

    

    mov x1, 110        // primer hoja

    mov x2, 300       

    mov x3, 50       

    mov x4, 1         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

    mov x1, 110       // primer hoja

    mov x2, 300       

    mov x3, 50       

    mov x4, 2         

    movz x10, #0x6533, lsl 16   

    movk x10, #0x4321, lsl 00

    bl draw_triangle

ldp X29, X30, [SP], #16

ret

   

   			//-------------------DIBUJAR LOGO-----------------------

   

   dibujar_logo:

stp X29, X30, [SP, #-16]!

// Parametros:

    // x10 - Color

    // x1  - X posición

    // x2  - Y posición

    // x3  - Ancho

    // x4  - Altura

   

        movz x10, 0x0000, lsl 16

	movk x10, 0x0000, lsl 00

	mov x1, #200

	mov x2, #195

	mov x3, #50

	mov x4, #17

     bl draw_rectangle

    // x1: coordenada x del centro del círculo

    // x2: coordenada y del centro del círculo

    // x3: radio del círculo

    // x10: color del círculo

    MOVZ X10, 0xFF80, LSL 0

    MOVK X10, 0x00FF, LSL 16

    mov x1, #195

	mov x2, #200

	mov x3, #35

bl dibujar_circulo

    MOVZ X10, 0x000, LSL 0

    MOVK X10, 0x000, LSL 16

    mov x1, #195

	mov x2, #200

	mov x3, #30

bl dibujar_circulo

	

   MOVZ X10, 0xFF80, LSL 0
    MOVK X10, 0x00FF, LSL 16

    mov x1, #180

	mov x2, #195

	mov x3, #30

	mov x4, #12

    bl draw_rectangle 

     

   

    mov x1, #178

	mov x2, #180

	mov x3, #12

	mov x4, #40

    bl draw_rectangle 

    mov x1, #203

	mov x2, #180

	mov x3, #12

	mov x4, #40

    bl draw_rectangle
    
ldp X29, X30, [SP], #16

ret

 apagar_logo:

stp X29, X30, [SP, #-16]!

// Parametros:

    // x10 - Color

    // x1  - X posición

    // x2  - Y posición

    // x3  - Ancho

    // x4  - Altura

   

        movz x10, 0x0000, lsl 16

	movk x10, 0x0000, lsl 00

	mov x1, #200

	mov x2, #195

	mov x3, #50

	mov x4, #17

     bl draw_rectangle

     // x1: coordenada x del centro del círculo

    // x2: coordenada y del centro del círculo

    // x3: radio del círculo

    // x10: color del círculo

    MOVZ X10, 0x8080, LSL 16

    MOVK X10, 0x8080, LSL 0

    mov x1, #195

	mov x2, #200

	mov x3, #35

bl dibujar_circulo

    MOVZ X10, 0x000, LSL 0

    MOVK X10, 0x000, LSL 16

    mov x1, #195

	mov x2, #200

	mov x3, #30

bl dibujar_circulo

	

    MOVZ X10, 0x8080, LSL 16

    MOVK X10, 0x8080, LSL 0

     mov x1, #180

	mov x2, #195

	mov x3, #30

	mov x4, #12

     bl draw_rectangle 
     
    mov x1, #178

	mov x2, #180

	mov x3, #12

	mov x4, #40
	
    bl draw_rectangle 
    
    mov x1, #203
    
	mov x2, #180
	
	mov x3, #12
	
	mov x4, #40
	
    bl draw_rectangle

ldp X29, X30, [SP], #16

ret

			//------------ANIMACION LUNA---------------------

   

 animation_luna:

  stp x29, x30, [sp, #-16]!

      mov x29, sp

      mov x23, 110

      mov x24, 90

      mov x26, 70

      mov x22, 12

   //movz x25, 0x1, lsl #48

   bl dibujar_luna

       loop_luna:

   

        mov x1, x23

	    mov x2, x24

	    mov x3, x26

	    MOVZ X10, 0x0030, LSL 0

        MOVK X10, 0x0800, LSL 16

	    bl dibujar_circulo

	   

   sub x24, x24, 15 

    mov x1, x23

    mov x2, x24

    mov x3, 70

    bl dibujar_luna

    movz x25, 0x911, lsl #16

   	

     loop_delay1:	   

	   sub x25,x25, 1

	   cbnz x25, loop_delay1

	   

	   sub x22, x22, 1

	   cbnz x22, loop_luna

	   mov sp, x29

   	   ldp x29, x30, [sp, #0]

	   add sp, sp, #16

    ret
    
    ret

    

			//----------------ANIMACION SOL----------------------

    animation_sol:
    
    

    	stp x29, x30, [sp, #-16]!

      mov x29, sp

      mov x27, 110

      mov x28, 500

      mov x26, 100

      mov x22, 27

   //movz x25, 0x1, lsl #48

   bl dibujar_sol
   
       loop_sol:

        mov x1, x27

	    mov x2, x28

	    mov x3, x26

	    MOVZ X10, 0x0030, LSL 0

        MOVK X10, 0x0800, LSL 16

	    MOVZ X10, 0x8CC4, LSL 0 

    	MOVK X10, 0x004F, LSL 16

	    bl dibujar_circulo
   sub x28, x28, 15 

    mov x1, x27

    mov x2, x28

    mov x3, 70


    bl dibujar_sol

    bl dibujar_pino

    bl dibujar_logo
    
    movz x25, 0x911, lsl #16

   	

     loop_delay2:	   

	   sub x25,x25, 1

	   cbnz x25, loop_delay2

	   

	   sub x22, x22, 1

	   cbnz x22, loop_sol

	   mov sp, x29

   	   ldp x29, x30, [sp, #0]

	   add sp, sp, #16

  ret

    ret

    

//----------------ANIMACION CIELO----------------------

animation_cielo:


    stp x29, x30, [sp, #-16]!
   
    mov x29, sp
   

    // Inicializar las variables para dibujar el cielo

    mov x1, #0                    // Coordenada x inicial

    mov x2, #0                    // Coordenada y inicial (parte superior)

    mov x3, SCREEN_WIDTH          // Ancho del rectángulo

    mov x4, SCREEN_HEIGHT         // Alto del rectángulo

    // Color celeste

    MOVZ X10, 0x8CC4, LSL 0 

    MOVK X10, 0x004F, LSL 16   
    
    

    // Dibujar un solo rectángulo que cubre todo el cielo

    bl move_to_pixel

    bl draw_rectangle

    // Dibujar los objetos encima del cielo

    bl dibujar_pino

    bl dibujar_edificio
    

    // Restaurar el stack y salir

    mov sp, x29
 
 
    ldp x29, x30, [sp], #16

    add sp, sp, #16
    
    ret
