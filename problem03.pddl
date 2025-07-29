(define (problem morning-cool)
    (:domain smart_campus)
    
    (:objects
        room1 - room
        ac1 ac2 - air-conditioner
        lamp1 lamp2 - light
        pj1 - projector
    )
    
    (:init
        (= (occupancy room1) 0)
        (= (power-device ac1) 1.5)
        (= (power-device ac2) 2.0)
        (= (power-device lamp1) 0.1)
        (= (power-device lamp2) 0.2)
        (= (power-device pj1) 0.5)
        (device-in-room room1 ac1)
        (device-in-room room1 ac2)
        (device-in-room room1 lamp1)
        (device-in-room room1 lamp2)
        (device-in-room room1 pj1)
        (device-on room1 ac1)
        (device-on room1 ac2)
        (device-on room1 lamp1)
        (device-on room1 lamp2)
        (device-on room1 pj1)
    )
    
    (:goal
        (and
            (not (device-on room1 ac1))
            (not (device-on room1 ac2))
            (not (device-on room1 lamp1))
            (not (device-on room1 lamp2))
            (not (device-on room1 pj1))
        )
    )
)