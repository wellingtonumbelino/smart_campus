; com esse domínio desejamos:
; ligar os ar-condicionados das salas no inicio do dia (7:30 da manhã) ao notar presença de pessoas na sala
; manter o ar-condicionado ligado durante o período de aulas da manhã (até 12:10) (não considerar: computando o valor de energia gasta durante o período)
; desligar os ar-condicionados durante o período do intervalo do almoço (das 12:10 às 13:20), se não tiver pessoas na sala
; ligar os ar-condicionados das salas no início da tarde (13:20 da tarde) ao notar a presença de pessoas na sala
; desligar os ar-condicionados no final do dia (22:30 da tarde) se não tiver pessoas na sala
; desligar os ar-condicionados em horários de aulas mas que não há pessoas na sala
; intervalo das aulas de 8h às 12h, das 13:30h às 17:30, e das 18h às 22h

(define (domain smart_campus)
  (:requirements :typing :fluents :durative-actions :negative-preconditions :timed-initial-literals)

  (:types
    room air-conditioner light
  )

  (:predicates
    (air_conditioner_on ?r - room ?a - air-conditioner)
    (light_on ?r - room ?l - light)
    (start_class)
    (operating_hour)
    (end_class ?r - room)
  )

  (:functions
    (occupancy ?r - room)
  )

  (:durative-action start_campus_operating
    :parameters ()
    :duration (= ?duration 0)
    :condition (and 
      (at start (operating_hour))
      (at start (not (start_class)))
    )
    :effect (and 
      (at start (start_class))
    )
  )

  (:durative-action turn_on_air_conditioner_during_class
    :parameters (?r - room ?a - air-conditioner)
    :duration (= ?duration 4)
    :condition (and
      (at start (not (air_conditioner_on ?r ?a)))
      (at start (> (occupancy ?r) 0))
      (at start (operating_hour))
      (over all (operating_hour))
    )
    :effect (and
      (at start (air_conditioner_on ?r ?a))
      (at end (not (air_conditioner_on ?r ?a)))
      (at end (end_class ?r))
    )
  )

  (:durative-action turn_on_light_during_class
    :parameters (?r - room ?l - light)
    :duration (= ?duration 4)
    :condition (and
      (at start (not (light_on ?r ?l)))
      (at start (> (occupancy ?r) 0))
      (at start (operating_hour))
      (over all (operating_hour))
    )
    :effect (and
      (at start (light_on ?r ?l))
      (at end (not (light_on ?r ?l)))
      (at end (end_class ?r))
    )
  )

  (:durative-action turn_off_air_conditioner_when_occupancy_zero
    :parameters (?r - room ?a - air-conditioner)
    :duration (= ?duration 0)
    :condition (and 
      (at start (= (occupancy ?r) 0))
      (at start (air_conditioner_on ?r ?a))
      (at start (operating_hour))
    )
    :effect (and 
      (at start (not (air_conditioner_on ?r ?a)))
    )
  )
  
  (:durative-action turn_off_light_when_occupancy_zero
    :parameters (?r - room ?l - light)
    :duration (= ?duration 0)
    :condition (and 
      (at start (= (occupancy ?r) 0))
      (at start (light_on ?r ?l))
      (at start (operating_hour))
    )
    :effect (and 
      (at start (not (light_on ?r ?l)))
    )
  )
)
