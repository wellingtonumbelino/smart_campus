(define (domain smart_campus)

    (:requirements :typing :durative-actions :numeric-fluents :fluents)

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
        (temperature ?r - room)
        (total-ac-room-occupancy ?r - room)
        (total-light-room-occupancy ?r - room)
        (total-acs-in-room ?r - room)
        (total-lights-in-room ?r - room)
        (acs-on-in-room ?r)
        (power-device ?d - device)
        (ac-occupancy-capacity ?a - air-conditioner)
        (light-occupancy-capacity ?l - light)
        (total-energy-consumed)
        (current-time)
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
                    (at end (increase (total-ac-room-occupancy ?r) (ac-occupancy-capacity ?a)))
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
                    (at end (increase (total-light-room-occupancy ?r) (light-occupancy-capacity ?l)))
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

    (:durative-action reduce_room_devices_capacity
        :parameters (?r - room ?a - air-conditioner)
        :duration (= ?duration 3.0)
        :condition (and
                        (at start (device-in-room ?r ?a))
                        (at start (device-on ?r ?a))
                        (at start (>= (current-time) 17500000))
                        (at start (<= (current-time) 20300000))
                        (at start (> (acs-on-in-room ?r) (/ (total-acs-in-room ?r) 2)))
        )
        :effect (and
                    (at start (not (device-on ?r ?a)))
                    (at start (decrease (acs-on-in-room ?r) 1))

        )
    )
)