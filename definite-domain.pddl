(define (domain smart_campus_teste)
  (:requirements :strips :typing :durative-actions :negative-preconditions :timed-initial-literals)

  (:types
    room air-conditioner light
  )

  (:predicates
    (operating_hour)
    (work_time)
    (finish_class_time)
    (people_in_room ?r - room)
    (air_conditioner_on ?r - room ?a - air-conditioner)
    (light_on ?r - room ?l - light)
  )

  (:durative-action start_campus_operating
    :parameters ()
    :duration (= ?duration 0.6)
    :condition (and
      (at start (operating_hour))
      (at start (not (work_time)))
      (over all (operating_hour))
    )
    :effect (and
      (at start (work_time))
      (at end (finish_class_time))
    )
  )

  (:durative-action turn_on_air_conditioner_during_class
    :parameters (?r - room ?a - air-conditioner)
    :duration (= ?duration 0.2)
    :condition (and
      (at start (work_time))
      (at start (people_in_room ?r))
      (at start (not (air_conditioner_on ?r ?a)))
      (over all (work_time))
    )
    :effect (and
      (at start (air_conditioner_on ?r ?a))
    )
  )

  (:durative-action turn_on_light_during_class
    :parameters (?r - room ?l - light)
    :duration (= ?duration 0.2)
    :condition (and
      (at start (work_time))
      (at start (people_in_room ?r))
      (at start (not (light_on ?r ?l)))
      (over all (work_time))
    )
    :effect (and
      (at start (light_on ?r ?l))
    )
  )

  (:durative-action turn_off_air_conditioner_when_occupancy_zero
    :parameters (?r - room ?a - air-conditioner)
    :duration (= ?duration 0)
    :condition (and
      (at start (work_time))
      (at start (not (people_in_room ?r)))
      (at start (air_conditioner_on ?r ?a))
    )
    :effect (and
      (at start (not (air_conditioner_on ?r ?a)))
    )
  )

  (:durative-action turn_off_light_when_occupancy_zero
    :parameters (?r - room ?l - light)
    :duration (= ?duration 0)
    :condition (and
      (at start (work_time))
      (at start (not (people_in_room ?r)))
      (at start (light_on ?r ?l))
    )
    :effect (and
      (at start (not (light_on ?r ?l)))
    )
  )
)
