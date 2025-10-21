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

    (:requirements :typing :fluents :durative-actions)

    (:types
        device
        room
        air_conditioner light projector - device
    )

    (:predicates
        (device_at ?r - room ?d - device)
        (device_on ?r - room ?d - device)
    )
    
    (:functions
        (occupancy ?r - room)
        (air_conditioner_temperature ?a - air_conditioner)
        (room_temperature ?r - room)
        (power_consumption ?d - device)
        (total_energy_consumed)
        (current_time)
    )

    (:durative-action turn_on_air_conditioner
        :parameters (?r - room ?a - air_conditioner)
        :duration (= ?duration 4.0)
        :condition (and
                        (at start (device_at ?r ?a))
                        (at start (not (device_on ?r ?a)))
                        (at start (> (occupancy ?r) 0))
        )
        :effect (and
                    (at start (device_on ?r ?a))
                    (at end (increase (total_energy_consumed) (* ?duration (power_consumption ?a))))
        )
    )
    
    (:durative-action turn_off_air_conditioner
        :parameters (?r - room ?a - air_conditioner)
        :duration (= ?duration 0.08333)
        :condition (and
                        (at start (device_at ?r ?a))
                        (at start (device_on ?r ?a))
                        (at start (= (occupancy ?r) 0))
        )
        :effect (at start (not (device_on ?r ?a)))
    )
    
    (:durative-action turn_on_light
        :parameters (?r - room ?l - light)
        :duration (= ?duration 4.0)
        :condition (and
                        (at start (device_at ?r ?l))
                        (at start (not (device_on ?r ?l)))
                        (at start (> (occupancy ?r) 0))
        )
        :effect (and
                    (at start (device_on ?r ?l))
                    (at end (increase (total_energy_consumed) (* ?duration (power_consumption ?l))))
        )
    )
    
    (:durative-action turn_off_light
        :parameters (?r - room ?l - light)
        :duration (= ?duration 0.08333)
        :condition (and
                        (at start (device_at ?r ?l))
                        (at start (device_on ?r ?l))
                        (at start (= (occupancy ?r) 0))
        )
        :effect (at start (not (device_on ?r ?l)))
    )
    
    (:durative-action turn_off_projector
        :parameters (?r - room ?p - projector)
        :duration (= ?duration 0.08333)
        :condition (and
                        (at start (device_at ?r ?p))
                        (at start (device_on ?r ?p))
                        (at start (= (occupancy ?r) 0))
        )
        :effect (at start (not (device_on ?r ?p)))
    )

    (:durative-action set_air_conditioner_temperature_to_22
        :parameters (?r - room ?a - air_conditioner)
        :duration (= ?duration 1.0)
        :condition (and
                        (at start (device_at ?r ?a))
                        (at start (device_on ?r ?a))
                        (at start (= (air_conditioner_temperature ?r) 24))
        )
        :effect (and
                    (at start (assign (air_conditioner_temperature ?r) 22))
                    (at end (increase (total_energy_consumed) (* ?duration (power_consumption ?a))))
                    (at end (assign (air_conditioner_temperature ?r) 24))
        )
    )
)