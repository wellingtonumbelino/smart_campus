(define (problem campus_multisalas)
  (:domain smart_campus)

  (:objects
    salaA - environment
    salaB - environment
    secretaria - environment
    estudo1 - environment
    estudo2 - environment

    ac1 ac2 ac3 ac4 - air_conditioner
    luz1 luz2 luz3 luz4 luz5 luz6 luz7 luz8 luz9 luz10 - light
  )

  (:init
    ; Localização dos dispositivos
    (device_at ac1 salaA)
    (device_at ac2 salaB)
    (device_at ac3 secretaria)
    (device_at ac4 estudo2)

    (device_at luz1 salaA)
    (device_at luz2 salaA)
    (device_at luz3 salaB)
    (device_at luz4 salaB)
    (device_at luz5 salaB)
    (device_at luz6 secretaria)
    (device_at luz7 secretaria)
    (device_at luz8 estudo1)
    (device_at luz9 estudo2)
    (device_at luz10 estudo2)

    ; Estado dos dispositivos
    (not (device_on ac1))
    (not (device_on ac2))
    (not (device_on ac3))
    (not (device_on ac4))

    (not (device_on luz1))
    (not (device_on luz2))
    (not (device_on luz3))
    (not (device_on luz4))
    (not (device_on luz5))
    (not (device_on luz6))
    (not (device_on luz7))
    (not (device_on luz8))
    (not (device_on luz9))
    (not (device_on luz10))

    ; Ocupação e temperatura
    (= (occupancy salaA) 25)
    (= (occupancy salaB) 18)
    (= (occupancy secretaria) 5)
    (= (occupancy estudo1) 3)
    (= (occupancy estudo2) 7)

    (= (temperature salaA) 29)
    (= (temperature salaB) 28)
    (= (temperature secretaria) 27)
    (= (temperature estudo1) 26)
    (= (temperature estudo2) 30)

    ; Consumo dos dispositivos
    (= (power_device ac1) 3)
    (= (power_device ac2) 3)
    (= (power_device ac3) 3)
    (= (power_device ac4) 3)

    (= (power_device luz1) 1)
    (= (power_device luz2) 1)
    (= (power_device luz3) 1)
    (= (power_device luz4) 1)
    (= (power_device luz5) 1)
    (= (power_device luz6) 1)
    (= (power_device luz7) 1)
    (= (power_device luz8) 1)
    (= (power_device luz9) 1)
    (= (power_device luz10) 1)

    ; Tempo e energia total
    (= (current_time) 25200)
    (= (total_energy_consumed) 0)
  )

  (:goal
    (and
      (device_on ac1)
      (device_on ac2)
      (device_on ac3)
      (device_on ac4)
      (device_on luz1)
      (device_on luz2)
      (device_on luz3)
      (device_on luz4)
      (device_on luz5)
      (device_on luz6)
      (device_on luz7)
      (device_on luz8)
      (device_on luz9)
      (device_on luz10)
    )
  )
  
  (:metric minimize (total_energy_consumed))
)