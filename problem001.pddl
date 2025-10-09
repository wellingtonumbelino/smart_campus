(define (problem ligar_dispositivos_sala101)
  (:domain smart_campus)

  (:objects
    sala101 - environment
    ar1 - air_conditioner
    luz1 - light
  )

  (:init
    (device_at ar1 sala101)
    (device_at luz1 sala101)
    (not (device_on ar1))
    (not (device_on luz1))
    (= (occupancy sala101) 10)
    (= (temperature sala101) 30)
    (= (power_device ar1) 3)
    (= (power_device luz1) 1)
    (= (total_energy_consumed) 0)
    (= (current_time) 25200) ; 7h da manhã
  )

  (:goal
    (and
      (device_on ar1)
      (device_on luz1)
      (< (temperature sala101) 30)
    )
  )
)