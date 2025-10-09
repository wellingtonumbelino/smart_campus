(define (problem desligar_dispositivos_vazios)
  (:domain smart_campus)

  (:objects
    salaA salaB secretaria estudo1 estudo2 - environment
    ac1 ac2 - air_conditioner
    luz1 luz2 luz3 - light
    proj1 proj2 - projector
  )

  (:init
    ; Localização dos dispositivos
    (device_at ac1 salaA)
    (device_at ac2 salaB)
    (device_at luz1 salaA)
    (device_at luz2 secretaria)
    (device_at luz3 estudo2)
    (device_at proj1 salaB)
    (device_at proj2 estudo1)

    ; Estado dos dispositivos (todos ligados)
    (device_on ac1)
    (device_on ac2)
    (device_on luz1)
    (device_on luz2)
    (device_on luz3)
    (device_on proj1)
    (device_on proj2)

    ; Ocupação dos ambientes (todos vazios)
    (= (occupancy salaA) 0)
    (= (occupancy salaB) 0)
    (= (occupancy secretaria) 0)
    (= (occupancy estudo1) 0)
    (= (occupancy estudo2) 0)

    ; Temperatura e consumo (não usados diretamente aqui)
    (= (temperature salaA) 25)
    (= (temperature salaB) 25)
    (= (temperature secretaria) 25)
    (= (temperature estudo1) 25)
    (= (temperature estudo2) 25)

    (= (power_device ac1) 3)
    (= (power_device ac2) 3)
    (= (power_device luz1) 1)
    (= (power_device luz2) 1)
    (= (power_device luz3) 1)
    (= (power_device proj1) 2)
    (= (power_device proj2) 2)

    (= (total_energy_consumed) 20)
    (= (current_time) 25200)
  )

  (:goal
    (and
      (not (device_on ac1))
      (not (device_on ac2))
      (not (device_on luz1))
      (not (device_on luz2))
      (not (device_on luz3))
      (not (device_on proj1))
      (not (device_on proj2))
    )
  )

  (:metric minimize (total_energy_consumed))
)