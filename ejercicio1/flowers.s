.globl draw_flower


draw_flower:
// Flor 1
	// Centro de la flor
	movz x0, 0x0009, lsl 16 	// Color 
	movk x0, 0x671A, lsl 0
	mov x1, #500            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #425            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #120	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #191            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #191	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #575            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #120	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	//------------Se repite el proceso para darle mas grosor----------------

	// Centro de la flor
	movz x0, 0x0009, lsl 16 	// Color 
	movk x0, 0x671A, lsl 0
	mov x1, #500            	// x_center 
	mov x2, #119            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #121            	// y_center 
	mov x3, #20 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #499            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #501            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #54	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #499            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #501            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #426            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #119	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #121            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #192            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #499            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #501            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #574            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #121	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #119            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	//------------Se repite el proceso para darle mas grosor----------------

	// Centro de la flor
	movz x0, 0x0009, lsl 16 	// Color 
	movk x0, 0x671A, lsl 0
	mov x1, #500            	// x_center 
	mov x2, #118            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #122            	// y_center 
	mov x3, #20 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #498            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #502            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #53	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #498            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #502            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #427            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #118	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #122            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #192            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #498            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #502            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #573            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #122	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #118            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	//------------Se repite el proceso para darle mas grosor----------------

	// Centro de la flor
	movz x0, 0x0009, lsl 16 	// Color 
	movk x0, 0x671A, lsl 0
	mov x1, #500            	// x_center 
	mov x2, #117            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #123            	// y_center 
	mov x3, #20 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #497            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #503            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #52	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #497            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #503            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #428            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #117	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #123            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #193            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #497            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #503            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #572            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #123	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #117            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	//------------Se repite el proceso para darle mas grosor----------------

	// Centro de la flor
	movz x0, 0x0009, lsl 16 	// Color 
	movk x0, 0x671A, lsl 0
	mov x1, #500            	// x_center 
	mov x2, #116            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #124            	// y_center 
	mov x3, #20 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #496            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #504            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #51	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #496            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #504            	// x_center 
	mov x2, #55	            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #429            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #116	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #425            	// x_center 
	mov x2, #124            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #194            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #496            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #504            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #571            	// x_center 
	mov x2, #120            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #124	           	// y_center 
	mov x3, #50            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #575            	// x_center 
	mov x2, #116            	// y_center 
	mov x3, #50            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
// Flor 2
	// Centro de la flor
	movz x0, 0x0039, lsl 16 	// Color 
	movk x0, 0x476B, lsl 0
	mov x1, #200            	// x_center 
	mov x2, #80            	// y_center 
	mov x3, #10           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80            	// y_center 
	mov x3, #10 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80            	// y_center 
	mov x3, #10           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #170            	// x_center 
	mov x2, #80            		// y_center 
	mov x3, #20            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #80	        	   	// y_center 
	mov x3, #20            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #80          	  	// y_center 
	mov x3, #20            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #200            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #110	           	// y_center 
	mov x3, #20            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #230            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #230            	// x_center 
	mov x2, #80		           	// y_center 
	mov x3, #20            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #230            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #20            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//---------- Capa de grosor-----------

	// Centro de la flor
	mov x1, #200            	// x_center 
	mov x2, #80	            	// y_center 
	mov x3, #11           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80	            	// y_center 
	mov x3, #11 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #11           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80	            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #21            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #21            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #21            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #170            	// x_center 
	mov x2, #80            		// y_center 
	mov x3, #21            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #80	        	   	// y_center 
	mov x3, #21            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #80          	  	// y_center 
	mov x3, #21            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #200            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #21           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #110	           	// y_center 
	mov x3, #21            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #21            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #230            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #21            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #230            	// x_center 
	mov x2, #80		           	// y_center 
	mov x3, #21            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #230            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #21            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//-------Otra capa----------

	// Centro de la flor
	mov x1, #200            	// x_center 
	mov x2, #80	            	// y_center 
	mov x3, #11           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80	            	// y_center 
	mov x3, #11 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #11           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #80	            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #22            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #22            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #50	            	// y_center 
	mov x3, #22            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #170            	// x_center 
	mov x2, #80            		// y_center 
	mov x3, #22            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #80	        	   	// y_center 
	mov x3, #22            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #80          	  	// y_center 
	mov x3, #22            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #200            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #22           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #110	           	// y_center 
	mov x3, #22            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #200            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #22            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #230            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #22            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #230            	// x_center 
	mov x2, #80		           	// y_center 
	mov x3, #22            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #230            	// x_center 
	mov x2, #80 	           	// y_center 
	mov x3, #22            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
// Flor 3
	// Centro de la flor
	movz x0, 0x00BB, lsl 16 	// Color 
	movk x0, 0x0B3C, lsl 0
	mov x1, #100            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #5		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #125     	       	// y_center 
	mov x3, #5	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #5           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #125            	// y_center 
	mov x3, #5            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #100            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #85	            	// x_center 
	mov x2, #125           		// y_center 
	mov x3, #10            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #85	            	// x_center 
	mov x2, #125	       	   	// y_center 
	mov x3, #10            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #85	            	// x_center 
	mov x2, #125          	  	// y_center 
	mov x3, #10            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #100            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #10           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #140	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #115            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #115            	// x_center 
	mov x2, #125	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #115            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//---------Otra capa-----------

	mov x1, #100            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #6		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #125     	       	// y_center 
	mov x3, #6	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #6           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #125            	// y_center 
	mov x3, #6            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #100            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #110            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #85	            	// x_center 
	mov x2, #125           		// y_center 
	mov x3, #11            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #85	            	// x_center 
	mov x2, #125	       	   	// y_center 
	mov x3, #11            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #85	            	// x_center 
	mov x2, #125          	  	// y_center 
	mov x3, #11            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #100            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #11           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #140	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #100            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #115            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #115            	// x_center 
	mov x2, #125	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #115            	// x_center 
	mov x2, #125 	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
ret

