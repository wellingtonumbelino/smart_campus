(define (domain smart_campus)

    (:requirements :typing :durative-actions :fluents)

    (:types
        device
        room
        air-conditioner light projector - device
    )

    (:predicates
        (device-in-room ?r - room ?d - device)
        (device-on ?r - room ?d - device)
    )
    
    (:functions
        (occupancy ?r - room)
        (power-device ?d - device)
        (temperature ?r - room)
        (ac-occupancy-capacity ?a - air-conditioner)
        (total-ac-room-occupancy ?r - room)
        (total-energy-consumed)
    )

    (:durative-action turn_on_air_conditioner
        :parameters (?r - room ?a - air-conditioner)
        :duration (= ?duration 4.0)
        :condition (and
                        (at start (device-in-room ?r ?a))
                        (at start (not (device-on ?r ?a)))
                        (at start (> (occupancy ?r) 0))
        )
        :effect (and
                    (at start (device-on ?r ?a))
                    (at start (assign (temperature ?r) 25))
                    (at end (increase (total-energy-consumed) (* ?duration (power-device ?a))))
                    (at end (increase (total-ac-room-occupancy) (ac-occupancy-capacity ?a)))
        )
    )
    
    (:durative-action turn_off_air_conditioner
        :parameters (?r - room ?a - air-conditioner)
        :duration (= ?duration 0.08333)
        :condition (and
                        (at start (device-in-room ?r ?a))
                        (at start (device-on ?r ?a))
                        (at start (= (occupancy ?r) 0))
        )
        :effect (at start (not (device-on ?r ?a)))
    )
    
    (:durative-action turn_on_light
        :parameters (?r - room ?l - light)
        :duration (= ?duration 4.0)
        :condition (and
                        (at start (device-in-room ?r ?l))
                        (at start (not (device-on ?r ?l)))
                        (at start (> (occupancy ?r) 0))
        )
        :effect (and
                    (at start (device-on ?r ?l))
                    (at end (increase (total-energy-consumed) (* ?duration (power-device ?l))))
        )
    )
    
    (:durative-action turn_off_light
        :parameters (?r - room ?l - light)
        :duration (= ?duration 0.08333)
        :condition (and
                        (at start (device-in-room ?r ?l))
                        (at start (device-on ?r ?l))
                        (at start (= (occupancy ?r) 0))
        )
        :effect (at start (not (device-on ?r ?l)))
    )
    
    (:durative-action turn_off_projector
        :parameters (?r - room ?p - projector)
        :duration (= ?duration 0.08333)
        :condition (and
                        (at start (device-in-room ?r ?p))
                        (at start (device-on ?r ?p))
                        (at start (= (occupancy ?r) 0))
        )
        :effect (at start (not (device-on ?r ?p)))
    )

    (:durative-action set_ac_temperature_to_22
        :parameters (?r - room ?a - air-conditioner)
        :duration (= ?duration 1.0)
        :condition (and
                        (at start (device-in-room ?r ?a))
                        (at start (device-on ?r ?a))
                        (at start (= (temperature ?r) 25))
        )
        :effect (and
                    (at start (assign (temperature ?r) 22))
                    (at end (increase (total-energy-consumed) (* ?duration (power-device ?a))))
                    (at end (assign (temperature ?r) 25))
        )
    )
)