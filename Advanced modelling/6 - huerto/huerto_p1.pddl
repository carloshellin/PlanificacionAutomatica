(define (problem huerto_p1)
	(:domain huerto)
	(:objects
		tomates pimientos lechuga - planta
		tienda1 - tienda
		tierra1 tierra2 - tierra
		casa1 - casa
		fuente1 - fuente
		regadera1 - regadera
		ana - agricultor
	)
	(:init (en ana casa1)
		   (libre tierra1) (libre tierra2)
		   (= (dur_comprar) 10)
		   (= (dur_plantar) 10)
		   (= (dur_regar) 2)
		   (= (agua_requerida tomates) 15)
		   (= (agua_requerida pimientos) 20)
		   (= (agua_requerida lechuga) 10)
		   (= (cantidad_agua regadera1) 0)
		   (= (dur_recoger) 2)
		   (= (numero_frutos tomates) 4)
		   (= (numero_frutos pimientos) 4)
		   (= (numero_frutos lechuga) 1)
		   
   		   (= (distancia casa1 tienda1) 20)
		   (= (distancia tienda1 casa1) 20)
		   (= (distancia casa1 tierra1) 10)
		   (= (distancia tierra1 casa1) 10)
		   (= (distancia casa1 tierra2) 10)
		   (= (distancia tierra2 casa1) 10)
		   (= (distancia tierra1 tierra2) 5)
		   (= (distancia tierra2 tierra1) 5)
		   (= (distancia casa1 fuente1) 20)
		   (= (distancia fuente1 casa1) 20)
		   (= (distancia tienda1 tierra1) 20)
		   (= (distancia tierra1 tienda1) 20)
		   (= (distancia tienda1 tierra2) 20)
		   (= (distancia tierra2 tienda1) 20)
		   (= (distancia tienda1 fuente1) 20)
		   (= (distancia fuente1 tienda1) 20)
		   (= (distancia tierra1 fuente1) 20)
		   (= (distancia fuente1 tierra1) 20)
		   (= (distancia tierra2 fuente1) 20)
		   (= (distancia fuente1 tierra2) 20)
		   
		   (= (velocidad ana) 5)
		   (= (energia ana) 50)
   		   (= (energia_total) 100)
		   (= (agua_total) 100)
		   (= (umbral_energia) 15)
		   (= (umbral_agua) 5)
		   (= (energia_plantar) 20)
		   (= (energia_regar) 15)
	
	)
	(:goal (and (recogida tomates tierra1)
				(recogida pimientos tierra2)
				(recogida lechuga tierra1)
		   )
	)
   
)