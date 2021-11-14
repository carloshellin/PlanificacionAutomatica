(define (problem pizzeria_p)
   (:domain pizzeria)
   (:objects 
			pizzeria house1 house2 - location
			pizza1 pizza2 - pizza
			dish1 dish2 - dish
			vespa - moto)
   (:init (free vespa)
		  (at-moto vespa pizzeria)
		  (is-pizzeria pizzeria)
   )
   (:goal (and (delivered pizza1 house1)
			   (delivered pizza2 house1)
			   (delivered dish1 house2)
			   (delivered dish2 house2)
		  )
   )
)