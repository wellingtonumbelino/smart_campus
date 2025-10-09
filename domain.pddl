(define (domain smart_campus)

  (:requirements :typing :fluents)

  (:types
    device
    environment
    air_conditioner light projector - device
  )

  ; un-comment following line if constants are needed
  ;(:constants )

  (:predicates
    (device_at ?d - device ?e - environment)
    (device_on ?d - device)
  )


  (:functions
    (occupancy ?e - environment) ; numero de pessoas no ambiente
    (temperature ?e - environment); temperatura atual do ambiente
    (power_device ?d - device) ; consumo de energia por hora do dispositivo
    (total_energy_consumed) ; consumo total de energia do campus
    (current_time) ; hora atual do dia
  )

  (:action turn_on_air_conditioner
    :parameters (?ac - air_conditioner ?e - environment)
    :precondition (and 
      (device_at ?ac ?e)
      (not (device_on ?ac))
      (= (current_time) 25200)
      (> (occupancy ?e) 0)
    )
    :effect (and 
      (device_on ?ac)
      (increase (total_energy_consumed) (power_device ?ac))
      (decrease (temperature ?e) 5)
    )
  )

  (:action turn_off_air_conditioner
    :parameters (?ac - air_conditioner ?e - environment)
    :precondition (and 
      (device_at ?ac ?e)
      (device_on ?ac)
      (= (occupancy ?e) 0)
    )
    :effect (and 
      (not (device_on ?ac))
    )
  )
  
  (:action turn_on_light
    :parameters (?l - light ?e - environment)
    :precondition (and 
      (device_at ?l ?e)
      (not (device_on ?l))
      (= (current_time) 25200)
      (> (occupancy ?e) 0)
    )
    :effect (and 
      (device_on ?l)
      (increase (total_energy_consumed) (power_device ?l))
    )
  )

  (:action turn_off_light
    :parameters (?l - light ?e - environment)
    :precondition (and 
      (device_at ?l ?e)
      (device_on ?l)
      (= (occupancy ?e) 0)
    )
    :effect (and 
      (not (device_on ?l))
    )
  )

  (:action turn_off_projector
    :parameters (?p - projector ?e - environment)
    :precondition (and 
      (device_at ?p ?e)
      (device_on ?p)
      (= (occupancy ?e) 0)
    )
    :effect (and 
      (not (device_on ?p))
    )
  )
)