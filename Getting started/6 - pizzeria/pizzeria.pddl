(define (domain pizzeria)
   (:requirements :strips :typing :equality)
   (:types dough pizza dish moto location pizzeria)
   (:predicates (kneaded ?d)
				(has-ingredients ?p)
				(baked ?p)
				(cooked ?di)
				(at-moto ?m ?l)
				(free ?m)
				(collected ?o ?l)
				(delivered ?o ?l)
				(loaded ?m ?p)
				(is-pizzeria ?l)
   )
   (:action kneadDough
       :parameters (?p - pizza)
	   :precondition ()
       :effect (kneaded ?p)
   )
   (:action addTopping
       :parameters (?p - pizza)
       :precondition (kneaded ?p)
       :effect (has-ingredients ?p)
   )
   (:action bake
       :parameters (?p - pizza)
       :precondition (and (kneaded ?p)
						  (has-ingredients ?p)
				     )
       :effect (baked ?p)
   )
   (:action cook
       :parameters (?di - dish)
	   :precondition ()
       :effect (cooked ?di)
   )
   (:action move
       :parameters (?m - moto ?l1 - location ?l2 - location)
       :precondition (and (not (= ?l1 ?l2)) 
						  (at-moto ?m ?l1)
                     )
       :effect (and (at-moto ?m ?l2)
					(not (at-moto ?m ?l1))
			   )
   )
   (:action load_pizza
       :parameters (?m - moto ?l - location ?o - pizza)
       :precondition (and (free ?m)
						  (is-pizzeria ?l)
						  (at-moto ?m ?l)
						  (baked ?o)
					 )
       :effect (and (not (free ?m))
					(loaded ?m ?o)
			   )
   )
   (:action load_dish
       :parameters (?m - moto ?l - location ?o - dish)
       :precondition (and (free ?m)
						  (is-pizzeria ?l)
						  (at-moto ?m ?l)
						  (cooked ?o)
					 )
       :effect (and (not (free ?m))
					(loaded ?m ?o)
			   )
   )
   (:action collectOrder
       :parameters (?m - moto ?l - location ?o - (either pizza dish))
       :precondition (and (at-moto ?m ?l)
						  (loaded ?m ?o)
					 )
       :effect (collected ?o ?l)
   )
   (:action deliverOrder
       :parameters (?m - moto ?o - (either pizza dish) ?l - location)
       :precondition (and (at-moto ?m ?l)
                          (collected ?o ?l)
						  (loaded ?m ?o)
                     )
       :effect (and (delivered ?o ?l)
					(free ?m)
					(not (loaded ?m ?o))
				)
   )
)