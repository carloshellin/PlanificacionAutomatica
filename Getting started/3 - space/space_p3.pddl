(define (problem space_p)
   (:domain space)
   (:objects satellite1 - satellite
             star0 phenomenon3 - direction
			 instrument1 - instrument
             spectrograph2 - mode)
   (:init (supports instrument1 spectrograph2)
          (on_board instrument1 satellite1)
		  (pointing satellite1 star0)
   )
   (:goal (have_image phenomenon3 spectrograph2)
   )
)