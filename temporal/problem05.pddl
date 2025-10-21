(define (problem morning-cool)
    (:domain smart_campus)
    
    (:objects
        room1 - room
        ac1 ac2 ac3 ac4 - air-conditioner
        lamp1 lamp2 lamp3 lamp4 lamp5 lamp6 - light
    )
    
    (:init
        (= (occupancy room1) 8)
        (= (power-device ac1) 1.5)
        (= (power-device ac2) 1.5)
        (= (power-device ac3) 1.5)
        (= (power-device ac4) 1.5)
        (= (power-device lamp1) 0.1)
        (= (power-device lamp2) 0.1)
        (= (power-device lamp3) 0.2)
        (= (power-device lamp4) 0.2)
        (= (power-device lamp5) 0.2)
        (= (power-device lamp6) 0.2)
        (= (ac-occupancy-capacity ac1) 5)
        (= (ac-occupancy-capacity ac2) 5)
        (= (ac-occupancy-capacity ac3) 5)
        (= (ac-occupancy-capacity ac4) 5)
        (= (light-occupancy-capacity lamp1) 3)
        (= (light-occupancy-capacity lamp2) 3)
        (= (light-occupancy-capacity lamp3) 5)
        (= (light-occupancy-capacity lamp4) 5)
        (= (light-occupancy-capacity lamp5) 5)
        (= (light-occupancy-capacity lamp6) 5)
        (device-in-room room1 ac1)
        (device-in-room room1 ac2)
        (device-in-room room1 ac3)
        (device-in-room room1 ac4)
        (device-in-room room1 lamp1)
        (device-in-room room1 lamp2)
        (device-in-room room1 lamp3)
        (device-in-room room1 lamp4)
        (device-in-room room1 lamp5)
        (device-in-room room1 lamp6)
        (= (temperature room1) 0)
        (= (total-energy-consumed) 0)
        (= (total-ac-room-occupancy room1) 0)
        (= (total-light-room-occupancy room1) 0)
    )
    
    (:goal
        (and
            (>= (total-ac-room-occupancy room1) (occupancy room1))
            (>= (total-light-room-occupancy room1) (occupancy room1))
        )
    )
)