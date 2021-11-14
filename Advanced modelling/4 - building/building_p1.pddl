(define (problem building_p1)
   (:domain building)
	(:objects
		n0 n1 n2 n3 n4 - number
		pepe clara - person
		slow1 slow2 - slowlift
		fast1 fast2 - fastlift
	)
	(:init
		(at n0 pepe) (at n1 clara)
		(at n4 fast1) (at n4 fast2)
		(at n4 slow1) (at n4 slow2)
		
		(capacity fast1 n0)
		(capacity fast2 n0)
		(capacity slow1 n0)
		(capacity slow2 n0)
		
		(next n0 n1)
		(next n1 n2)
		(next n2 n3)
		(next n3 n4)
		
		(next2 n0 n2)
		(next2 n2 n4)
		
		(previous n4 n3)
		(previous n3 n2)
		(previous n2 n1)
		(previous n1 n0)
		
		(previous2 n4 n2)
		(previous2 n2 n0)
		
		(= (dur_move) 10)
		(= (dur_board_leave) 1)
		(= (total_time) 0)
	)
	(:goal (and (at n4 pepe)
				(at n4 clara)
			)
	)
	(:metric minimize (total_time))
)