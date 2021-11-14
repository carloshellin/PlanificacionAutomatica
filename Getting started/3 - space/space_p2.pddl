(define (problem space_p)
   (:domain space)
   (:objects s - satellite
             DirPhenomenon4 DirStar5 DirPhenomenon6 - direction
			 i - instrument
             Mode_thermograph0 - mode)
   (:init (supports i Mode_thermograph0)
          (on_board i s)
		  (pointing s DirPhenomenon4)
   )
   (:goal (and (have_image DirPhenomenon4 Mode_thermograph0)
			   (have_image DirStar5 Mode_thermograph0)
			   (have_image DirPhenomenon6 Mode_thermograph0)
          )
   )
)