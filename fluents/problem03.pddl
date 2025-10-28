(define (problem ufc_qxd_bl1_terreo)
    (:domain smart_campus)
    ; controle de ar-condicionados das salas de aula do bloco 1: cada sala tem dois ar-condicionados
    
    (:objects
        bl1_sl1 bl1_sl2 bl1_sl3 bl1_sl4 - room
        bl1_sl1_ac1 bl1_sl1_ac2 bl1_sl2_ac1 bl1_sl2_ac2 bl1_sl3_ac1 bl1_sl3_ac2 bl1_sl4_ac1 bl1_sl4_ac2 - air_conditioner
    )
    
    (:init
        ; ar-condicionados nas salas
        (device_at bl1_sl1_ac1 bl1_sl1)
        (device_at bl1_sl1_ac2 bl1_sl1)
        (device_at bl1_sl2_ac1 bl1_sl2)
        (device_at bl1_sl2_ac2 bl1_sl2)
        (device_at bl1_sl3_ac1 bl1_sl3)
        (device_at bl1_sl3_ac2 bl1_sl3)
        (device_at bl1_sl4_ac1 bl1_sl4)
        (device_at bl1_sl4_ac2 bl1_sl4)
        
        ; ocupacao das salas
        (= (occupancy bl1_sl1) 10)
        (= (occupancy bl1_sl2) 7)
        (= (occupancy bl1_sl3) 13)
        (= (occupancy bl1_sl4) 7)
        
        ; temperatura das salas com ar-condicionado
        (= (room_temperature bl1_sl1) 33)
        (= (room_temperature bl1_sl2) 31)
        (= (room_temperature bl1_sl3) 37)
        (= (room_temperature bl1_sl4) 32)
        
        (= (current_time) 25250)
    )
    
    (:goal
        (and
        ; meta conforto dos usuarios - temperatura da sala menor ou igual a 24 graus.  
           (<= (room_temperature bl1_sl1) 24)
           (<= (room_temperature bl1_sl2) 24)
           (<= (room_temperature bl1_sl3) 24)
           (<= (room_temperature bl1_sl4) 24)
        )
    )
)
