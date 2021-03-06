(define (domain moving_out)
	(:requirements :typing :equality :durative-actions :conditional-effects :fluents)
	(:types
		location
	)
	(:constants Container - object)
	(:predicates
		(at ?o - object ?origin - location)
		(in ?o - object)
	)
	(:functions
		(dur_take_out ?o - object)
	)
	(:action move 
		:parameters (?origin - location ?destination - location)
		:precondition (and (not (= ?origin ?destination))
							    (at Container ?origin)

					  )
		:effect (and (at Container ?destination) 
					 (not (at Container ?origin))
					 (forall (?o - object)
								(when (and (not (= ?o Container))
										   (in ?o))
						(and (at ?o ?destination)
							 (not (at ?o ?origin))
						)
								)
					)
				)
	)
	(:action put-in 
		:parameters (?o - object ?l - location)
		:precondition (not (= ?o Container))
		:effect (when (and (at Container ?l)
						   (at ?o ?l)
						   (not (in ?o))
					  )
							(and (in ?o)
								 (not (at ?o ?l))
							)
				)
	)
	(:durative-action take-out
		:parameters (?o - object ?l - location)
		:duration (= ?duration (dur_take_out ?o))
		:condition (and (at start (in ?o))
					    (over all (not (= ?o Container)))
						(over all (at Container ?l))
				   )
		:effect (and (at start (not (in ?o)))
					 (at end (at ?o ?l))
				)
	)
)