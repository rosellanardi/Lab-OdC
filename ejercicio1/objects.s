.equ SCREEN_WIDTH,   640
	
.include "forms.s"
dibujar_luna:
stp X29, X30, [SP, #-16]!
// x1: coordenada x del centro del círculo
    // x2: coordenada y del centro del círculo
    // x3: radio del círculo
    // x10: color del círculo
	MOVZ X10, 0xFFFF, LSL 0
    MOVK X10, 0x00FF, LSL 16
	mov x1, #110
	mov x2, #90
	mov x3, #70
bl dibujar_circulo
	// x1: coordenada x del centro del círculo
    // x2: coordenada y del centro del círculo
    // x3: radio del círculo
    // x10: color del círculo
	MOVZ X10, 0x0099, LSL 16
    MOVK X10, 0x9999, LSL 00
	mov x1, #100
	mov x2, #120
	mov x3, #25
bl dibujar_circulo
	MOVZ X10, 0x0099, LSL 16
    MOVK X10, 0x9999, LSL 00
	mov x1, #90
	mov x2, #75
	mov x3, #15
bl dibujar_circulo
	MOVZ X10, 0x0099, LSL 16
    MOVK X10, 0x9999, LSL 00
	mov x1, #70
	mov x2, #50
	mov x3, #5
bl dibujar_circulo
	MOVZ X10, 0x0030, LSL 0
    MOVK X10, 0x0800, LSL 16
	mov x1, #150
	mov x2, #90
	mov x3, #70
bl dibujar_circulo
ldp X29, X30, [SP], #16
ret
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

   
  
  
    
    






	


	
	
	    
    
    


