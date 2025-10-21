(define (problem bl1_rpet)
    (:domain smart_campus)
    
    (:objects
        bl1-rpet - room
        bl1-rpet-ac1 - air-conditioner
        bl1-rpet-l1 bl1-rpet-l2 - light
        bl1-rpet-p1 - projector
    )
    
    (:init
        (= (occupancy bl1-rpet) 1)
        (= (power-device bl1-rpet-ac1) 1.5)
        (= (power-device bl1-rpet-l1) 0.1)
        (= (power-device bl1-rpet-l2) 0.2)
        (= (power-device bl1-rpet-p1) 0.5)
        (= (ac-occupancy-capacity bl1-rpet-ac1) 8)
        (= (light-occupancy-capacity bl1-rpet-l1) 3)
        (= (light-occupancy-capacity bl1-rpet-l2) 3)
        (device-in-room bl1-rpet bl1-rpet-ac1)
        (device-in-room bl1-rpet bl1-rpet-l1)
        (device-in-room bl1-rpet bl1-rpet-l2)
        (device-in-room bl1-rpet bl1-rpet-p1)
        (device-on bl1-rpet ac1)
        (device-on bl1-rpet ac2)
        (device-on bl1-rpet lamp1)
        (device-on bl1-rpet lamp2)
        (device-on bl1-rpet pj1)
        (= (total-ac-room-occupancy bl1-rpet) 0)
        (= (total-light-room-occupancy bl1-rpet) 0)
    )
    
    (:goal
        (and
            (device-on bl1-rpet bl1-rpet-ac1)
            (device-on bl1-rpet bl1-rpet-l1)
            (not (device-on bl1-rpet bl1-rpet-l2))
            (not (device-on bl1-rpet bl1-rpet-p1))
        )
    )
)