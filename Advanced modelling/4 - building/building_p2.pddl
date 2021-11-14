(define (problem building_p1)
   (:domain building)
	(:objects
		n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 - number
		pepe clara ana carlos - person
		slow1 slow2 - slowlift
		fast1 fast2 - fastlift
	)
	(:init
		(at n0 pepe) (at n1 clara)
		(at n4 ana) (at n4 carlos)
		(at n0 fast1) (at n0 fast2)
		(at n0 slow1) (at n0 slow2)
		
		(capacity fast1 n0)
		(capacity fast2 n0)
		(capacity slow1 n0)
		(capacity slow2 n0)
		
		(next n0 n1)
		(next n1 n2)
		(next n2 n3)
		(next n3 n4)
		(next n4 n5)
		(next n5 n6)
		(next n6 n7)
		(next n7 n8)
		(next n8 n9)
		
		(next2 n0 n2)
		(next2 n2 n4)
		(next2 n4 n6)
		(next2 n6 n8)
		
		(previous n9 n8)
		(previous n8 n7)
		(previous n7 n6)
		(previous n6 n5)
		(previous n5 n4)
		(previous n4 n3)
		(previous n3 n2)
		(previous n2 n1)
		(previous n1 n0)
		
		(previous2 n8 n6)
		(previous2 n6 n4)
		(previous2 n4 n2)
		(previous2 n2 n0)
		
		(= (dur_move) 10)
		(= (dur_board_leave) 1)
		(= (total_time) 0)
	)
	(:goal (and (at n9 pepe)
				(at n9 clara)
				(at n0 ana)
				(at n0 carlos)
			)
	)
	(:metric minimize (total_time))
)