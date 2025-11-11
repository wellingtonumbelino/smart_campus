(define (problem turn-on-bl1-sl1)
    (:domain smart_campus)
    
    (:requirements
        :strips
        :typing
        :fluents
        :durative-actions
        :timed-initial-literals
        :timed-initial-fluents
    )
    
    (:objects
        bl1_sl1 - room
        bl1_sl1_a1 bl1_sl1_a2 bl1_sl1_a3 bl1_sl1_a4 - air_conditioner
    )
    
    (:init
        (device_at bl1_sl1 bl1_sl1_a1)
        (device_at bl1_sl1 bl1_sl1_a2)
        (device_at bl1_sl1 bl1_sl1_a3)
        (device_at bl1_sl1 bl1_sl1_a4)
        
        (= (occupancy bl1_sl1) 6)
        (= (room_temperature bl1_sl1) 35)
        (= (time_required bl1_sl1) 4)
        (= (current_time) 8)
        
        (at 7 (operating_hour))
        (at 22 (not (operating_hour)))
    )
    
    (:goal
        (and
            (end_class bl1_sl1)
        )
    )
)
