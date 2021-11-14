(define (problem pizzeria_p)
   (:domain pizzeria)
	(:objects 
		pizzeria - local
		repsol - gasStation
		casa1 casa2  - house
		lasagna macarrones - dish
		pizza1 - pizza
		vespa - moto
	)
	(:init
		(= (cantidad_gasolina vespa) 30) ; in liters
		(= (capacidad_gasolina vespa) 180)
		(= (gasolina_requerida pizzeria casa1) 20) ; in liters
		(= (gasolina_requerida casa1 pizzeria) 20)
		(= (gasolina_requerida pizzeria casa2) 25)
		(= (gasolina_requerida casa2 pizzeria) 25)
		(= (gasolina_requerida repsol casa2) 30)
		(= (gasolina_requerida casa2 repsol) 30)
		(= (gasolina_requerida repsol casa1) 30)
		(= (gasolina_requerida casa1 repsol) 30)
		(= (gasolina_requerida repsol pizzeria) 30)
		(= (gasolina_requerida pizzeria repsol) 30)
		(= (gasolina_requerida casa1 casa2) 20)
		(= (gasolina_requerida casa2 casa1) 20)
	   
		(= (distancia pizzeria casa1) 2) ; in kms
		(= (distancia casa1 pizzeria) 2)
		(= (distancia pizzeria casa2) 3)
		(= (distancia casa2 pizzeria) 3)
		(= (distancia repsol casa2) 5)
		(= (distancia casa2 repsol) 5)
		(= (distancia repsol casa1) 5)
		(= (distancia casa1 repsol) 5)
		(= (distancia repsol pizzeria) 5)
		(= (distancia pizzeria repsol) 5)
		(= (distancia casa1 casa2) 4)
		(= (distancia casa2 casa1) 4)

		(= (dur_Knead) 3) ; in min
		(= (dur_addTop) 1) ; in min
		(= (dur_cook lasagna) 40) ; in min
		(= (dur_cook macarrones) 35) ; in min
		(= (dur_bake) 15) ; in min
		(= (dur_collect) 1) ; in min
		(= (dur_deliver) 1) ; in min
		(= (dur_refuel) 5) ; in min
		(= (dur_load) 1) ; in min
		
		(= (velocidad vespa) 35) ; in km/h 
	  
		(= (umbral_gasolina) 20) ; refuel the motorcycle when the tank has a capacity of 20 liters or below

		(at pizzeria vespa) 

		(= (capacidad_moto vespa) 3) 
		(= (carga_actual vespa) 0) 
		
		(= (total_time) 0)
	)
	(:goal (and (entregado pizza1 casa1)
				(entregado lasagna casa1)
				(entregado macarrones casa2)
			)
	)
	(:metric minimize (total_time)) 
)