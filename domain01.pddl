(define (domain smart_campus)
  (:requirements :strips :typing :negative-preconditions :fluents)
  (:types
    room
    device
    air-conditioning projector - device
    switch
    occupancy
  )

  (:predicates
    (switch-on ?s - switch)
    (in-use ?d - device)
    (off ?d - device)
    (has-device ?r - room ?d - device)
    (has-switch ?r - room ?s - switch)
  )

  (:functions
    (occupied ?o - occupancy)
    (total-energy-consumed)
  )

  (:action turn-on-switch-threshold
    :parameters (?r - room ?o - occupancy ?s - switch ?energy ?min ?max)
    :precondition (and (has-switch ?r ?s)
                       (>= (occupied ?o) ?min)
                       (<= (occupied ?o) ?max)
                       (not (switch-on ?s)))
    :effect (and (switch-on ?s)
                 (increase (total-energy-consumed) ?energy))
  )

  (:action turn-off-switch-threshold
    :parameters (?r - room ?o - occupancy ?s - switch)
    :precondition (and (has-switch ?r ?s)
                       (= (occupied ?o) 0)
                       (switch-on ?s))
    :effect (not (switch-on ?s))
  )

  (:action turn-on-air-conditioning-threshold
    :parameters (?r - room ?o - occupancy ?ac - air-conditioning ?energy ?min ?max)
    :precondition (and (has-device ?r ?ac)
                       (>= (occupied ?o) ?min)
                       (<= (occupied ?o) ?max)
                       (not (off ?ac)))
    :effect (and (in-use ?ac)
                 (increase (total-energy-consumed) ?energy))
  )

  (:action turn-off-air-conditioning-threshold
    :parameters (?r - room ?o - occupancy ?ac - air-conditioning)
    :precondition (and (has-device ?r ?ac)
                       (= (occupied ?o) 0)
                       (in-use ?ac))
    :effect (off ?ac)
  )

  (:action turn-on-projector-threshold
    :parameters (?r - room ?o - occupancy ?p - projector ?energy ?min ?max)
    :precondition (and (has-device ?r ?p)
                       (>= (occupied ?o) ?min)
                       (<= (occupied ?o) ?max)
                       (not (off ?p)))
    :effect (and (in-use ?p)
                 (increase (total-energy-consumed) ?energy))
  )

  (:action turn-off-projector-threshold
    :parameters (?r - room ?o - occupancy ?p - projector)
    :precondition (and (has-device ?r ?p)
                  (= (occupied ?o) 0)
                  (in-use ?p))
    :effect (off ?p)
  )
)