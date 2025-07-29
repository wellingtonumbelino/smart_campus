(define (problem morning-cool)
    (:domain smart_campus)
    
    (:objects
        room1 - room
        ac1 - air-conditioner
    )
    
    (:init
        (= (temperature room1) 25)
        (= (power-device ac1) 3.0)
        (device-in-room room1 ac1)
        (device-on room1 ac1)
        (= (total-energy-consumed) 0)
    )
    
    (:goal
        (and
            (= (total-energy-consumed) 3.0)
            (= (temperature room1) 25)
        )
    )
)