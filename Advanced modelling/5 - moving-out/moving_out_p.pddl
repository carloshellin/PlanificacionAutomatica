(define (problem moving_out_p)
	(:domain moving_out)
	(:objects
		d p m - object
		Alcala Madrid - location
	)
	(:init (at Container Alcala) (at d Alcala) (in p) (at m Madrid)
          ;Take out durations for each object
		  (= (dur_take_out d) 10)
		  (= (dur_take_out p) 20)
		  (= (dur_take_out m) 30)
	)
	(:goal (and (at Container Madrid)
				(at d Madrid) 
				(at p Alcala)
				(at m Alcala)
		   )
	)
   
)