(define (problem ufc_qxd_bl1_terreo)
    (:domain smart_campus)
    
    (:objects
        bl1_sl1 bl1_sl2 bl1_sl3 bl1_sl4 bl1_pet_ti bl1_pet_si bl1_sec_acm bl1_coord_acm bl1_coord_com bl1_tel bl1_ban_masc bl1_ban_fem bl1_dep_limp bl1_hall - room
        bl1_sl1_ac1 bl1_sl1_ac2 bl1_sl2_ac1 bl1_sl2_ac2 bl1_sl3_ac1 bl1_sl3_ac2 bl1_sl4_ac1 bl1_sl4_ac2 - air_conditioner
        bl1_pet_ti_ac1 bl1_pet_si_ac1 - air_conditioner
        bl1_sl1_pjr1 bl1_sl2_pjr1 bl1_sl3_pjr1 bl1_sl4_pjr1 - projector
        bl1_sl1_light1 bl1_sl1_light2 bl1_sl1_light3 bl1_sl1_light4 - light
        bl1_sl2_light1 bl1_sl2_light2 bl1_sl2_light3 bl1_sl2_light4 - light
        bl1_sl3_light1 bl1_sl3_light2 bl1_sl3_light3 bl1_sl3_light4 - light
        bl1_sl4_light1 bl1_sl4_light2 bl1_sl4_light3 bl1_sl4_light4 - light
        bl1_pet_ti_light1 bl1_pet_ti_light2 bl1_pet_si_light1 bl1_pet_si_light2 - light
        bl1_sec_acm_light1 bl1_sec_acm_light2 bl1_sec_acm_light3 bl1_sec_acm_light4 - light
        bl1_coord_acm_light1 bl1_coord_acm_light2 - light
        bl1_coord_com_light1 bl1_coord_com_light2 - light
        bl1_tel_light1 bl1_tel_light2 - light
        bl1_ban_masc_light1 bl1_ban_fem_light1 bl1_dep_limp_light1 - light
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
        (device_at bl1_pet_ti_ac1 bl1_pet_ti)
        (device_at bl1_pet_si_ac1 bl1_pet_si)
        
        ; projetos nas salas
        (device_at bl1_sl1_pjr1 bl1_sl1)
        (device_at bl1_sl2_pjr1 bl1_sl2)
        (device_at bl1_sl3_pjr1 bl1_sl3)
        (device_at bl1_sl4_pjr1 bl1_sl4)
        
        ; luzes na sala 1
        (device_at bl1_sl1_light1 bl1_sl1)
        (device_at bl1_sl1_light2 bl1_sl1)
        (device_at bl1_sl1_light3 bl1_sl1)
        (device_at bl1_sl1_light4 bl1_sl1)
        
        ; luzes na sala 2
        (device_at bl1_sl2_light1 bl1_sl2)
        (device_at bl1_sl2_light2 bl1_sl2)
        (device_at bl1_sl2_light3 bl1_sl2)
        (device_at bl1_sl2_light4 bl1_sl2)
        
        ; luzes na sala 3
        (device_at bl1_sl3_light1 bl1_sl3)
        (device_at bl1_sl3_light2 bl1_sl3)
        (device_at bl1_sl3_light3 bl1_sl3)
        (device_at bl1_sl3_light4 bl1_sl3)
        
        ; luzes na sala 4
        (device_at bl1_sl4_light1 bl1_sl4)
        (device_at bl1_sl4_light2 bl1_sl4)
        (device_at bl1_sl4_light3 bl1_sl4)
        (device_at bl1_sl4_light4 bl1_sl4)
    
        ; luzes nos PETs
        (device_at bl1_pet_ti_light1 bl1_pet_ti)
        (device_at bl1_pet_ti_light2 bl1_pet_ti)
        (device_at bl1_pet_si_light1 bl1_pet_si)
        (device_at bl1_pet_si_light2 bl1_pet_si)
    
        ; luzes na secretaria academica
        (device_at bl1_sec_acm_light1 bl1_sec_acm)
        (device_at bl1_sec_acm_light2 bl1_sec_acm)
        (device_at bl1_sec_acm_light3 bl1_sec_acm)
        (device_at bl1_sec_acm_light4 bl1_sec_acm)
    
        ; luzes na coordenação academica
        (device_at bl1_coord_acm_light1 bl1_coord_acm)
        (device_at bl1_coord_acm_light2 bl1_coord_acm)
    
        ; luzes na coordenação comunicacao
        (device_at bl1_coord_com_light1 bl1_coord_com)
        (device_at bl1_coord_com_light2 bl1_coord_com)
    
        ; luzes na telematica
        (device_at bl1_tel_light1 bl1_tel)
        (device_at bl1_tel_light2 bl1_tel)
    
        ; luzes nos banheiros e depósito
        (device_at bl1_ban_masc_light1 bl1_ban_masc)
        (device_at bl1_ban_fem_light1 bl1_ban_fem)
        (device_at bl1_dep_limp_light1 bl1_dep_limp)
        
        ; ocupacao das salas
        (= (occupancy bl1_sl1) 10)
        (= (occupancy bl1_sl2) 7)
        (= (occupancy bl1_sl3) 13)
        (= (occupancy bl1_sl4) 7)
        (= (occupancy bl1_pet_ti) 1)
        (= (occupancy bl1_pet_si) 5)
        (= (occupancy bl1_sec_acm) 4)
        (= (occupancy bl1_coord_acm) 2)
        (= (occupancy bl1_coord_com) 1)
        (= (occupancy bl1_tel) 0)
        (= (occupancy bl1_ban_masc) 0)
        (= (occupancy bl1_ban_fem) 0)
        (= (occupancy bl1_dep_limp) 0)
        (= (occupancy bl1_hall) 7)
        
        
        ; temperatura das salas com ar-condicionado
        (= (room_temperature bl1_sl1) 33)
        (= (room_temperature bl1_sl2) 31)
        (= (room_temperature bl1_sl3) 37)
        (= (room_temperature bl1_sl4) 32)
        (= (room_temperature bl1_pet_ti) 30)
        (= (room_temperature bl1_pet_si) 37)

        ; consumo energético dos ar-condicionados por kWh/min
        (= (power_consumption bl1_sl1_ac1) 0.00771)
        (= (power_consumption bl1_sl1_ac2) 0.00771)
        (= (power_consumption bl1_sl2_ac1) 0.00771)
        (= (power_consumption bl1_sl2_ac2) 0.00771)
        (= (power_consumption bl1_sl3_ac1) 0.00771)
        (= (power_consumption bl1_sl3_ac2) 0.00771)
        (= (power_consumption bl1_sl4_ac1) 0.00771)
        (= (power_consumption bl1_sl4_ac2) 0.00771)
        (= (power_consumption bl1_pet_ti_ac1) 0.00771)
        (= (power_consumption bl1_pet_si_ac1) 0.00771)
        
        ; consumo energético dos projetores por kWh/min
        (= (power_consumption bl1_sl1_pjr1) 0.00575)
        (= (power_consumption bl1_sl2_pjr1) 0.00575)
        (= (power_consumption bl1_sl3_pjr1) 0.00575)
        (= (power_consumption bl1_sl4_pjr1) 0.00575)
        
        ; consumo energético das lâmpadas por kWh/min
        (= (power_consumption bl1_sl1_light1) 0.000333)
        (= (power_consumption bl1_sl1_light2) 0.000333)
        (= (power_consumption bl1_sl1_light3) 0.000333)
        (= (power_consumption bl1_sl1_light4) 0.000333)
        (= (power_consumption bl1_sl2_light1) 0.000333)
        (= (power_consumption bl1_sl2_light2) 0.000333)
        (= (power_consumption bl1_sl2_light3) 0.000333)
        (= (power_consumption bl1_sl2_light4) 0.000333)
        (= (power_consumption bl1_sl3_light1) 0.000333)
        (= (power_consumption bl1_sl3_light2) 0.000333)
        (= (power_consumption bl1_sl3_light3) 0.000333)
        (= (power_consumption bl1_sl3_light4) 0.000333)
        (= (power_consumption bl1_sl4_light1) 0.000333)
        (= (power_consumption bl1_sl4_light2) 0.000333)
        (= (power_consumption bl1_sl4_light3) 0.000333)
        (= (power_consumption bl1_sl4_light4) 0.000333)
        (= (power_consumption bl1_pet_ti_light1) 0.000333)
        (= (power_consumption bl1_pet_ti_light2) 0.000333)
        (= (power_consumption bl1_pet_si_light1) 0.000333)
        (= (power_consumption bl1_pet_si_light2) 0.000333)
        (= (power_consumption bl1_sec_acm_light1) 0.000333)
        (= (power_consumption bl1_sec_acm_light2) 0.000333)
        (= (power_consumption bl1_sec_acm_light3) 0.000333)
        (= (power_consumption bl1_sec_acm_light4) 0.000333)
        (= (power_consumption bl1_coord_acm_light1) 0.000333)
        (= (power_consumption bl1_coord_acm_light2) 0.000333)
        (= (power_consumption bl1_coord_com_light1) 0.000333)
        (= (power_consumption bl1_coord_com_light2) 0.000333)
        (= (power_consumption bl1_tel_light1) 0.000333)
        (= (power_consumption bl1_tel_light2) 0.000333)
        (= (power_consumption bl1_ban_masc_light1) 0.000333)
        (= (power_consumption bl1_ban_fem_light1) 0.000333)
        (= (power_consumption bl1_dep_limp_light1) 0.000333)
        
        (= (total_energy_consumed) 0)
        (= (current_time) 25250)
    )
    
    (:goal
        (and
            ; Ar-condicionados ligados se houver ocupação
            (device_on bl1_sl1_ac1)
            (device_on bl1_sl1_ac2)
            (device_on bl1_sl2_ac1)
            (device_on bl1_sl2_ac2)
            (device_on bl1_sl3_ac1)
            (device_on bl1_sl3_ac2)
            (device_on bl1_sl4_ac1)
            (device_on bl1_sl4_ac2)
            (device_on bl1_pet_ti_ac1)
            (device_on bl1_pet_si_ac1)
    
            ; Todas as luzes ligadas
            (device_on bl1_sl1_light1)
            (device_on bl1_sl1_light2)
            (device_on bl1_sl1_light3)
            (device_on bl1_sl1_light4)
            (device_on bl1_sl2_light1)
            (device_on bl1_sl2_light2)
            (device_on bl1_sl2_light3)
            (device_on bl1_sl2_light4)
            (device_on bl1_sl3_light1)
            (device_on bl1_sl3_light2)
            (device_on bl1_sl3_light3)
            (device_on bl1_sl3_light4)
            (device_on bl1_sl4_light1)
            (device_on bl1_sl4_light2)
            (device_on bl1_sl4_light3)
            (device_on bl1_sl4_light4)
            (device_on bl1_pet_ti_light1)
            (device_on bl1_pet_ti_light2)
            (device_on bl1_pet_si_light1)
            (device_on bl1_pet_si_light2)
            (device_on bl1_sec_acm_light1)
            (device_on bl1_sec_acm_light2)
            (device_on bl1_sec_acm_light3)
            (device_on bl1_sec_acm_light4)
            (device_on bl1_coord_acm_light1)
            (device_on bl1_coord_acm_light2)
            (device_on bl1_coord_com_light1)
            (device_on bl1_coord_com_light2)
            (device_on bl1_tel_light1)
            (device_on bl1_tel_light2)
            (device_on bl1_ban_masc_light1)
            (device_on bl1_ban_fem_light1)
            (device_on bl1_dep_limp_light1)
        )
    )
)