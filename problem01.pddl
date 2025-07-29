(define (problem morning-cool)
    (:domain smart_campus)
    
    (:objects
        room1 - room
        ac1 - air-conditioner
    )
    
    (:init
        (= (occupancy room1) 5)
        (= (power-device ac1) 1.5)
        (device-in-room room1 ac1)
        (= (temperature room1) 0)
        (= (total-energy-consumed) 0)
    )
    
    (:goal
        (and
            (device-on room1 ac1)
        )
    )
)