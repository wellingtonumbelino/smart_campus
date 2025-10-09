(define (problem ajustar_dispositivos_por_ocupacao)
  (:domain smart_campus)

  (:objects
    salaVazia salaAula1 salaAula2 secretaria - environment
    ac1 ac2 - air_conditioner
    luz1 luz2 luz3 luz4 - light
  )

  (:init
    ; Localização dos dispositivos
    (device_at ac1 salaVazia)
    (device_at luz1 salaVazia)

    (device_at ac2 salaAula1)
    (device_at luz2 salaAula1)

    (device_at luz3 salaAula2)
    (device_at luz4 secretaria)

    ; Estado dos dispositivos
    (device_on ac1)
    (device_on luz1)

    (not (device_on ac2))
    (not (device_on luz2))
    (not (device_on luz3))
    (not (device_on luz4))

    ; Ocupação dos ambientes
    (= (occupancy salaVazia) 0)
    (= (occupancy salaAula1) 15)
    (= (occupancy salaAula2) 10)
    (= (occupancy secretaria) 5)

    ; Temperatura dos ambientes
    (= (temperature salaVazia) 25)
    (= (temperature salaAula1) 30)
    (= (temperature salaAula2) 28)
    (= (temperature secretaria) 27)

    ; Consumo dos dispositivos
    (= (power_device ac1) 3)
    (= (power_device ac2) 3)
    (= (power_device luz1) 1)
    (= (power_device luz2) 1)
    (= (power_device luz3) 1)
    (= (power_device luz4) 1)

    ; Tempo e energia total
    (= (current_time) 25200)
    (= (total_energy_consumed) 10)
  )

  (:goal
    (and
      ; Desligar dispositivos em sala vazia
      (not (device_on ac1))
      (not (device_on luz1))

      ; Ligar dispositivos em ambientes ocupados
      (device_on ac2)
      (device_on luz2)
      (device_on luz3)
      (device_on luz4)

      ; Temperatura ajustada em salaAula1
      (< (temperature salaAula1) 30)
    )
  )

  (:metric minimize (total_energy_consumed))
)