(define (domain smart_campus)
   ; com esse domínio desejamos:
   ; ligar os ar-condicionados das salas no inicio do dia (7:50 da manhã) ao notar presença de pessoas na sala
   ; manter o ar-condicionado ligado durante o período de aulas da manhã (até 12:10), computando o valor de energia gasta durante o período
   ; desligar os ar-condicionados durante o período do intervalo do almoço (das 12:10 às 13:20), se não tiver pessoas na sala
   ; ligar os ar-condicionados das salas no início da tarde (13:20 da tarde) ao notar a presença de pessoas na sala
   ; desligar os ar-condicionados no final do dia (17:40 da tarde) se não tiver pessoas na sala
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
    (room_temperature ?r - room); temperatura atual da sala
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
)
