(define (domain smart-campus)
  (:requirements :strips :typing :fluents :numeric-fluents :negative-preconditions :durative-actions)

  (:types
    air_conditioning
    energy
    light
    projector
    room
  )

  (:predicates
    (in-room ?r - room)
    (air-condition-on ?a - air_conditioning)
    (light-on ?l - light)
    (projector-on ?p - projector)
  )

  (:functions
    (energy-consumed ?e - energy)
    (time)
    (total-energy-consumed)
  )

  ; monitoro -> avalio -> executo
  ; como saber quanto tempo os dispositivos ficarão ligados?

  (:action turn_on_air_conditioning
    :parameters (?r - room
                  ?a - air_conditioning
                  ?e - energy)
    :precondition (and (not (air-condition-on ?a)) (in-room ?r))
    :effect (and (air-condition-on ?a)
                  (increase (total-energy-consumed) (energy-consumed ?e)))
  )

  (:action turn_off_air_conditioning
    :parameters (?a - air_conditioning
                 ?r - room)
    :precondition (and (air-condition-on ?a)
                       (in-room ?r))
    :effect (and (not (air-condition-on ?a)))
  )

  (:action turn_on_light
      :parameters (?r - room
                   ?l - light
                   ?e - energy)
      :precondition (and (not (light-on ?l)) (in-room ?r))
      :effect (and (light-on ?l)
                   (increase (total-energy-consumed) (energy-consumed ?e)))
  )

  (:action turn_off_light
    :parameters (?l - light
                 ?r - room)
    :precondition (and (light-on ?l)
                       (in-room ?r))
    :effect (and (not (light-on ?l)))
  )

  (:action turn_on_projector
      :parameters (?p - projector
                   ?r - room
                   ?e - energy)
      :precondition (and (not (projector-on ?p)) (in-room ?r))
      :effect (and (projector-on ?p)
                   (increase (total-energy-consumed) (energy-consumed ?e)))
  )

  (:action turn_off_projector
      :parameters (?p - projector
                   ?r - room)
      :precondition (and (projector-on ?p) (in-room ?r))
      :effect (and (not (projector-on ?p)))
  )

  (:durative-action turn-off-air-conditioning-in-interval
    :parameters (
      ?a - air_conditioning
      ?r - room
    )
    :duration (= ?duration 1)
    :condition (and 
        (at start (and (= (time) 432000)
                        (air-condition-on ?a)))
        (over all (and (not (air-condition-on ?a))))
        (at end (and (= (time) 46800)))
    )
    :effect (and 
        (at start (and (not (air-condition-on ?a))))
        (at end (and (air-condition-on ?a)))
    )
  )

  (:durative-action turn-off-light-in-interval
    :parameters (
      ?l - light
      ?r - room
    )
    :duration (= ?duration 1)
    :condition (and 
        (at start (and (= (time) 432000)
                        (light-on ?l)))
        (over all (and (not (light-on ?l))))
        (at end (and (= (time) 46800)))
    )
    :effect (and 
        (at start (and (not (light-on ?l))))
        (at end (and (light-on ?l)))
    )
  )
)

; como parâmetro podemos ter o ?q ?q_less_ten ?q_greater_ten_less_twenty ?q_greater_twenty - quantity