(define (problem morning-cool)
    (:domain smart_campus)
    
    (:objects
        room1 - room
        lamp1 lamp2 - light
    )
    
    (:init
        (= (occupancy room1) 5)
        (= (power-device lamp1) 0.1)
        (= (power-device lamp2) 0.2)
        (device-in-room room1 lamp1)
        (device-in-room room1 lamp2)
        (= (temperature room1) 0)
        (= (total-energy-consumed) 0)
    )
    
    (:goal
        (and
            (device-on room1 lamp1)
            (device-on room1 lamp2)
        )
    )
)