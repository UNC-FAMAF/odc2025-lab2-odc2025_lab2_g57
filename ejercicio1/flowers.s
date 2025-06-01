.globl draw_flower


draw_flower:
// Flor 1
	// Centro de la flor
	movz x0, 0x00A1, lsl 16 	// Color 
	movk x0, 0xC30B, lsl 0
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #20 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #20           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #20            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #30	            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #30	            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #440            	// x_center 
	mov x2, #85  	          	// y_center 
	mov x3, #40            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #440            	// x_center 
	mov x2, #85		           	// y_center 
	mov x3, #40            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #440            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #140	           	// y_center 
	mov x3, #40            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #560            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #560            	// x_center 
	mov x2, #85		           	// y_center 
	mov x3, #40            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #560            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #40            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//--------Segunda capa para mas grosor-----------

	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #21           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #21 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #21           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #21            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #30	            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #30	            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #440            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #440            	// x_center 
	mov x2, #85		           	// y_center 
	mov x3, #41            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #440            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #140	           	// y_center 
	mov x3, #41            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #560            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #560            	// x_center 
	mov x2, #85		           	// y_center 
	mov x3, #41            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #560            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #41            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	
	//----------Tercera capa-------------

	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #22           		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #22 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #22           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #22            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #500            	// x_center 
	mov x2, #30	            	// y_center 
	mov x3, #42            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #30	            	// y_center 
	mov x3, #42            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #440            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #42            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #440            	// x_center 
	mov x2, #85		           	// y_center 
	mov x3, #42            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #440            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #42            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #500            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #42            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #140	           	// y_center 
	mov x3, #42            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #500            	// x_center 
	mov x2, #140            	// y_center 
	mov x3, #42            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #560            	// x_center 
	mov x2, #85 	           	// y_center 
	mov x3, #42            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #560            	// x_center 
	mov x2, #85		           	// y_center 
	mov x3, #42            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #560            	// x_center 
	mov x2, #85	            	// y_center 
	mov x3, #42            		// Radio
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
// Flor 4
	// Centro de la flor
	movz x0, 0x0011, lsl 16 	// Color 
	movk x0, 0x05AD, lsl 0
	mov x1, #150            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #8		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190     	       	// y_center 
	mov x3, #8	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #8           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #8            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #15            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #15            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #15            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #130	           	// x_center 
	mov x2, #190           		// y_center 
	mov x3, #15            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #130            	// x_center 
	mov x2, #190	       	   	// y_center 
	mov x3, #15            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #130            	// x_center 
	mov x2, #190          	  	// y_center 
	mov x3, #15            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #150            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #15           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #210	           	// y_center 
	mov x3, #15            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #15            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #170            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #15            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #15            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #15            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//------Segunda capa----------

	mov x1, #150            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #9		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190     	       	// y_center 
	mov x3, #9	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #9           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #9            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #16            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #16            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #16            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #130	           	// x_center 
	mov x2, #190           		// y_center 
	mov x3, #16            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #130            	// x_center 
	mov x2, #190	       	   	// y_center 
	mov x3, #16            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #130            	// x_center 
	mov x2, #190          	  	// y_center 
	mov x3, #16            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #150            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #16           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #210	           	// y_center 
	mov x3, #16            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #16            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #170            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #16            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #16            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #16            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//------------Tercera capa-------

	mov x1, #150            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #7		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190     	       	// y_center 
	mov x3, #7	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #7           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #190            	// y_center 
	mov x3, #7            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #14            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #14            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #170            	// y_center 
	mov x3, #14            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #130	           	// x_center 
	mov x2, #190           		// y_center 
	mov x3, #14            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #130            	// x_center 
	mov x2, #190	       	   	// y_center 
	mov x3, #14            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #130            	// x_center 
	mov x2, #190          	  	// y_center 
	mov x3, #14            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #150            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #14           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #210	           	// y_center 
	mov x3, #14            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #150            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #14            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #170            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #14            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #190	           	// y_center 
	mov x3, #14            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #170            	// x_center 
	mov x2, #190 	           	// y_center 
	mov x3, #14            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
// Flor 5
	// Centro de la flor
	movz x0, 0x00EE, lsl 16 	// Color 
	movk x0, 0xF352, lsl 0
	mov x1, #50	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #5		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #210     	       	// y_center 
	mov x3, #5	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #5           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #5            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #50	            	// x_center 
	mov x2, #195            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #195            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #195            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #35		           	// x_center 
	mov x2, #210           		// y_center 
	mov x3, #10            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #35	            	// x_center 
	mov x2, #210	       	   	// y_center 
	mov x3, #10            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #35	            	// x_center 
	mov x2, #210          	  	// y_center 
	mov x3, #10            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #50	            	// x_center 
	mov x2, #225            	// y_center 
	mov x3, #10           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #225	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #225            	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #65	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #65	            	// x_center 
	mov x2, #210	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #65	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #10            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle


	//--------Segunda capa-------

	mov x1, #50	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #6		       		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #210     	       	// y_center 
	mov x3, #6	 	          	// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #6           		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #210            	// y_center 
	mov x3, #6            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de arriba
	mov x1, #50	            	// x_center 
	mov x2, #195            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #195            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #195            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la izquierda
	mov x1, #35		           	// x_center 
	mov x2, #210           		// y_center 
	mov x3, #11            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #35	            	// x_center 
	mov x2, #210	       	   	// y_center 
	mov x3, #11            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #35	            	// x_center 
	mov x2, #210          	  	// y_center 
	mov x3, #11            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de abajo
	mov x1, #50	            	// x_center 
	mov x2, #225            	// y_center 
	mov x3, #11           		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #225	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #2              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #50	            	// x_center 
	mov x2, #225            	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle

	// Petalo de la derecha
	mov x1, #65	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #3              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #65	            	// x_center 
	mov x2, #210	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #0              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
	mov x1, #65	            	// x_center 
	mov x2, #210 	           	// y_center 
	mov x3, #11            		// Radio
	mov x4, #1              	// Direccion
	mov x5, #0					// Relleno
	bl draw_semi_circle
ret
