; com esse domínio desejamos:
; ligar os ar-condicionados das salas no inicio do dia (7:30 da manhã) ao notar presença de pessoas na sala
; manter o ar-condicionado ligado durante o período de aulas da manhã (até 12:10) (não considerar: computando o valor de energia gasta durante o período)
; desligar os ar-condicionados durante o período do intervalo do almoço (das 12:10 às 13:20), se não tiver pessoas na sala
; ligar os ar-condicionados das salas no início da tarde (13:20 da tarde) ao notar a presença de pessoas na sala
; desligar os ar-condicionados no final do dia (22:30 da tarde) se não tiver pessoas na sala
; desligar os ar-condicionados em horários de aulas mas que não há pessoas na sala
; intervalo das aulas de 8h às 12h, das 13:30h às 17:30, e das 18h às 22h

(define (domain smart_campus)
  (:requirements :typing :fluents :durative-actions :negative-preconditions :timed-initial-literals)

  (:types
    room device
  )

  (:predicates
    (device_on ?r - room ?d - device)
    (device_at ?r - room ?d - device)
    (operating_hour)
    (end_class ?r - room ?d - device)
  )

  (:functions
    (occupancy ?r - room)
    (current_time)
  )

  (:durative-action turn_on_air_conditioner_during_class
    :parameters (?r - room ?d - device)
    :duration (= ?duration 4)
    :condition (and
      (at start (>= (current_time) 7))
      (at start (device_at ?r ?d))
      (at start (not (device_on ?r ?d)))
      (at start (> (occupancy ?r) 0))
      (at start (operating_hour))
      (over all (operating_hour))
    )
    :effect (and
      (at start (device_on ?r ?d))
      (at end (not (device_on ?r ?d)))
      (at end (end_class ?r ?d))
    )
  )
)
