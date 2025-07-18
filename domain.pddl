(define (domain smart_campus)
  (:requirements :strips :typing :fluents :durative-actions)
  (:types
    room
    device
    air-conditioner projector - device
    switch
    occupancy
    temperature-sensor
  )

  (:predicates
    (switch-on ?s - switch)
    (in-use ?d - device)
    (device-in-room ?d - device ?r - room)
    (switch-in-room ?s - switch ?r - room)
    (sensor-in-room ?ts - temperature-sensor ?r - room)
  )

  (:functions
    (occupied ?o - occupancy)
    (total-energy-consumed)
    (time)
    (current-temperature ?r - room)
    (ac-set-temperature ?ac - air-conditioner)
  )

  (:action turn-on-switch
    :parameters (?r - room ?o - occupancy ?s - switch ?energy ?min ?max)
    :precondition (and (switch-in-room ?s ?r)
                       (>= (occupied ?o) ?min)
                       (<= (occupied ?o) ?max)
                       (not (switch-on ?s)))
    :effect (and (switch-on ?s)
                 (increase (total-energy-consumed) ?energy))
  )

  (:action turn-off-switch
    :parameters (?r - room ?o - occupancy ?s - switch)
    :precondition (and (switch-in-room ?s ?r)
                       (= (occupied ?o) 0)
                       (switch-on ?s))
    :effect (not (switch-on ?s))
  )

  (:action turn-on-air-conditioner
    :parameters (?r - room ?o - occupancy ?ac - air-conditioner ?energy ?min ?max)
    :precondition (and (device-in-room ?ac ?r)
                       (>= (occupied ?o) ?min)
                       (<= (occupied ?o) ?max)
                       (not (in-use ?ac)))
    :effect (and (in-use ?ac)
                 (increase (total-energy-consumed) ?energy))
  )

  (:action turn-off-air-conditioner
    :parameters (?r - room ?o - occupancy ?ac - air-conditioner)
    :precondition (and (device-in-room ?ac ?r)
                       (= (occupied ?o) 0)
                       (in-use ?ac))
    :effect (not (in-use ?ac))
  )

  (:action turn-on-projector
    :parameters (?r - room ?o - occupancy ?p - projector ?energy ?min ?max)
    :precondition (and (device-in-room ?p ?r)
                       (>= (occupied ?o) ?min)
                       (<= (occupied ?o) ?max)
                       (not (in-use ?p)))
    :effect (and (in-use ?p)
                 (increase (total-energy-consumed) ?energy))
  )

  (:action turn-off-projector
    :parameters (?r - room ?o - occupancy ?p - projector)
    :precondition (and (device-in-room ?p ?r)
                  (= (occupied ?o) 0)
                  (in-use ?p))
    :effect (not (in-use ?p))
  )

  (:action set-ac-temperature-to-25
    :parameters (?r - room ?ac - air-conditioner ?ts - temperature-sensor)
    :precondition (and
      (device-in-room ?ac ?r)
      (sensor-in-room ?ts ?r)
      (> (current-temperature ?r) 25)
      (in-use ?ac)
    )
    :effect (assign (ac-set-temperature ?ac) 25)
  )

  (:action set-ac-temperature-to-22
    :parameters (?r - room ?ac - air-conditioner ?ts - temperature-sensor)
    :precondition (and
      (device-in-room ?ac ?r)
      (sensor-in-room ?ts ?r)
      (< (current-temperature ?r) 22)
      (<= (current-temperature ?r) 25)
      (in-use ?ac)
    )
    :effect (assign (ac-set-temperature ?ac) 22)
  )

  (:durative-action turn-off-air-conditioner-interval
    :parameters (?ac - air-conditioner ?r - room)
    :duration (= ?duration 3600)
    :condition (and
      (at start (and (device-in-room ?ac ?r) (in-use ?ac) (>= (time) 43200) (<= (time) 46800)))
      (over all (not (in-use ?ac)))
      (at end (in-use ?ac))
    )
    :effect (and (at start (not (in-use ?ac)))
                 (at end (in-use ?ac)))
  )

  (:durative-action turn-off-light-interval
    :parameters (?l - switch ?r - room)
    :duration (= ?duration 3600)
    :condition (and
      (at start (and (switch-in-room ?l ?r) (switch-on ?l) (>= (time) 43200) (<= (time) 46800)))
      (over all (not (switch-on ?l)))
      (at end (switch-on ?l))
    )
    :effect (and (at start (not (switch-on ?l)))
                 (at end (switch-on ?l)))
  )

  (:durative-action wait-turn-off-projector-after-class
    :parameters (?p - projector ?r - room)
     :duration (= ?duration 900)
    :condition (and
      (at start (and (device-in-room ?p ?r) (in-use ?p) (= (time) 43200)))
      (over all (in-use ?p))
      (at end (device-in-room ?p ?r))
    )
    :effect (at end (not (in-use ?p)))
  )
)