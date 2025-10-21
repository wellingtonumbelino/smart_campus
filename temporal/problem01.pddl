(define (problem morning-cool)
    (:domain smart_campus)
    
    (:objects
        room1 - room
        ac1 ac2 ac3 ac4 - air-conditioner
    )
    
    (:init
        (= (occupancy room1) 8)
        (= (power-device ac1) 1.5)
        (= (power-device ac2) 1.5)
        (= (power-device ac3) 1.5)
        (= (power-device ac4) 1.5)
        (= (ac-occupancy-capacity ac1) 5)
        (= (ac-occupancy-capacity ac2) 5)
        (= (ac-occupancy-capacity ac3) 5)
        (= (ac-occupancy-capacity ac4) 5)
        (device-in-room room1 ac1)
        (device-in-room room1 ac2)
        (device-in-room room1 ac3)
        (device-in-room room1 ac4)
        (= (temperature room1) 0)
        (= (total-energy-consumed) 0)
        (= (total-ac-room-occupancy room1) 0)
    )
    
    (:goal
        (and
            (>= (total-ac-room-occupancy room1) (occupancy room1))
        )
    )
)