(define (domain smart_campus)
   ; com esse domínio desejamos:
   ; ligar os ar-condicionados das salas no inicio do dia (7:50 da manhã) ao notar presença de pessoas na sala
   ; manter o ar-condicionado ligado durante o período de aulas da manhã (até 12:10), computando o valor de energia gasta durante o período
   ; desligar os ar-condicionados durante o período do intervalo do almoço (das 12:10 às 13:20), se não tiver pessoas na sala
   ; ligar os ar-condicionados das salas no início da tarde (13:20 da tarde) ao notar a presença de pessoas na sala
   ; desligar os ar-condicionados no final do dia (17:40 da tarde) se não tiver pessoas na sala
   ; ligar e desligar luzes
   ; desligar projetor - o projetor será ligado conforme a necessidade do humano (professor/aluno)
   ; desligar os ar-condicionados em horários de aulas mas que não há pessoas na sala

  (:requirements :typing :fluents)

  (:types
    device ; é um dispositivo consumidor de energia
    room ; é uma sala
    air_conditioner light projector - device ; tipos de dispositivos
  )

  (:predicates
    (device_at ?d - device ?r - room) ; dispositivo localizado em uma sala
    (device_on ?d - device) ; dispositivo ligado ou desligado
  )

  (:functions
    (occupancy ?r - room) ; numero de pessoas na sala
    (air_conditioner_temperature ?a - air_conditioner) ; temperatura atual do ar-condicionado
    (room_temperature ?r - room); temperatura atual da sala
    (power_consumption ?d - device) ; consumo de energia por minuto do dispositivo
    (total_energy_consumed) ; consumo total de energia do campus
    (current_time) ; hora atual do dia
  )

  (:action turn_on_air_conditioner
    :parameters (?ac - air_conditioner ?r - room)
    :precondition (and 
      (device_at ?ac ?r)
      (not (device_on ?ac))
      (>= (current_time) 25200) ; após 7:50 da manhã em segundos
      (> (occupancy ?r) 0) ; o número de ocupantes deve ser maior do que zero
    )
    :effect (and 
      (device_on ?ac)
      (increase (total_energy_consumed) (power_consumption ?ac))
    )
  )

  (:action turn_off_air_conditioner
    :parameters (?ac - air_conditioner ?r - room)
    :precondition (and 
      (device_at ?ac ?r)
      (device_on ?ac)
      (= (occupancy ?r) 0)
    )
    :effect (and 
      (not (device_on ?ac))
    )
  )
  
  (:action turn_on_light
    :parameters (?l - light ?r - room)
    :precondition (and 
      (device_at ?l ?r)
      (not (device_on ?l))
      (= (current_time) 25200)
      (> (occupancy ?r) 0)
    )
    :effect (and 
      (device_on ?l)
      (increase (total_energy_consumed) (power_consumption ?l))
    )
  )

  (:action turn_off_light
    :parameters (?l - light ?r - room)
    :precondition (and 
      (device_at ?l ?r)
      (device_on ?l)
      (= (occupancy ?r) 0)
    )
    :effect (and 
      (not (device_on ?l))
    )
  )

  (:action turn_off_projector
    :parameters (?p - projector ?r - room)
    :precondition (and 
      (device_at ?p ?r)
      (device_on ?p)
      (= (occupancy ?r) 0)
    )
    :effect (and 
      (not (device_on ?p))
    )
  )

  (:action set_air_conditioner_temp_22_degrees
    :parameters (?r - room ?a - air_conditioner)
    :precondition (and
      (device_at ?a ?r)
      (device_on ?a)
      (> (room_temperature ?r) 24)
      (> (occupancy ?r) 0)
    )
    :effect (and
      (assign (air_conditioner_temperature ?a) 22)
    )
  )

  (:action set_air_conditioner_temp_24_degrees
    :parameters (?r - room ?a - air_conditioner)
    :precondition (and
      (device_at ?a ?r)
      (device_on ?a)
      (<= (room_temperature ?r) 24)
      (>= (room_temperature ?r) 22)
      (> (occupancy ?r) 0)
    )
    :effect (and
      (assign (air_conditioner_temperature ?a) 24)
    )
  )
)
