(define (domain huerto)
	(:requirements :typing :durative-actions :fluents :equality)
	(:types
		planta localizacion regadera agricultor
		tienda - localizacion
		tierra - localizacion
		casa - localizacion
		fuente - localizacion
	)
	(:predicates
		(en ?g - agricultor ?l - localizacion)
		(tiene_semillas ?p - planta)
		(libre ?t - tierra)
		(abonada ?t - tierra)
		(plantada ?p - planta ?t - tierra)
		(regada ?p - planta)
		(recogida ?p - planta ?t - tierra)
	)
	(:functions
		(dur_comprar)
		(dur_plantar)
		(dur_regar)
		(agua_requerida ?p - planta)
		(cantidad_agua ?r - regadera)
		(dur_recoger)
		(numero_frutos ?p - planta)
		(distancia ?l1 ?l2 - localizacion)
		(velocidad ?g - agricultor)
		(energia ?g - agricultor)
		(energia_total)
		(agua_total)
		(umbral_energia)
		(umbral_agua)
		(energia_plantar)
		(energia_regar)
	)
	(:durative-action comprar-semillas
		:parameters (?p - planta ?g - agricultor ?t - tienda)
		:duration (= ?duration (dur_comprar))
		:condition (over all (en ?g ?t))
		:effect (at end (tiene_semillas ?p))
	)
	(:action abonar
		:parameters (?g - agricultor ?t - tierra)
		:precondition (en ?g ?t)
		:effect (abonada ?t)
	)
	(:durative-action plantar
		:parameters (?p - planta ?g - agricultor ?t - tierra)
		:duration (= ?duration (dur_plantar))
		:condition (and (at start (abonada ?t))
						(at start (tiene_semillas ?p))
						(at start (libre ?t))
						(over all (en ?g ?t))
						(at start (>= (energia ?g) (energia_plantar)))
				   )
		:effect (and (at end (not (libre ?t)))
					 (at end (not (tiene_semillas ?p)))
					 (at end (plantada ?p ?t))
					 (at end (decrease (energia ?g) (energia_plantar)))
				)
	)
	(:durative-action regar
		:parameters (?p - planta ?t - tierra ?g - agricultor ?r - regadera)
		:duration (= ?duration (* (dur_regar) (agua_requerida ?p)))
		:condition (and (at start (plantada ?p ?t))
						(over all (en ?g ?t))
						(at start (>= (cantidad_agua ?r) (agua_requerida ?p)))
						(at start (>= (energia ?g) (energia_regar)))
					)
		:effect (and (at end (regada ?p))
					 (at end (decrease (cantidad_agua ?r) (agua_requerida ?p)))
					 (at end (decrease (energia ?g) (energia_regar)))
				)
	)
	(:durative-action recoger
		:parameters (?p - planta ?t - tierra ?g - agricultor)
		:duration (= ?duration (* (dur_recoger) (numero_frutos ?p)))
		:condition (and (at start (plantada ?p ?t))
						(at start (regada ?p))
						(over all (en ?g ?t))
					)
		:effect (and (at end (recogida ?p ?t))
					 (at end (not (regada ?p)))
					 (at end (not (plantada ?p ?t)))
					 (at end (libre ?t))
					 (at end (not (abonada ?t)))
				)
	)
	(:durative-action mover
		:parameters (?g - agricultor ?l1 - localizacion ?l2 - localizacion)
		:duration (= ?duration (/ (distancia ?l1 ?l2) (velocidad ?g)))
		:condition (and (over all (not (= ?l1 ?l2)))
						(at start (en ?g ?l1))
						(at start (>= (energia ?g) (distancia ?l1 ?l2)))
				   )
		:effect (and (at end (en ?g ?l2))
					 (at start (not (en ?g ?l1)))
					 (at end (decrease (energia ?g) (distancia ?l1 ?l2)))
				)
	)
	(:durative-action descansar
		:parameters (?g - agricultor ?c - casa)
		:duration (= ?duration (- (energia_total) (energia ?g)))
		:condition (and (at start (> (umbral_energia) (energia ?g)))
						(over all (en ?g ?c))
					)
		:effect (at end (assign (energia ?g) (energia_total)))
	)
	(:durative-action rellenar
		:parameters (?g - agricultor ?f - fuente ?r - regadera)
		:duration (= ?duration (- (agua_total) (cantidad_agua ?r)))
		:condition (and (at start (> (umbral_agua) (cantidad_agua ?r)))
						(over all (en ?g ?f))
					)
		:effect (at end (assign (cantidad_agua ?r) (agua_total)))
	)
)