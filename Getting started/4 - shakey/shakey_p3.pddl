(define (problem gripper-four-balls)
   (:domain shakey)
   (:objects room1 room2 room3 room4 - room
             box1 - box
             shakey1 - shakey)
   (:init (at-shakey shakey1 room1)
		  (on-floor shakey1)
          (at-box box1 room4)
		  (has-door room1 room2)
		  (has-door room1 room3)
		  (has-door room3 room4)
		  (has-door room2 room1)
		  (has-door room3 room1)
		  (has-door room4 room3)
   )
   (:goal (and (switched room1)
			   (switched room2)
			   (switched room3)
			   (switched room4)
          )
   )
)