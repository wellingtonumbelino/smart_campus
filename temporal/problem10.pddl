(define (problem turn-on-bl1-sl1)
  (:domain smart_campus)

  (:requirements :strips :typing :fluents :durative-actions :negative-preconditions :timed-initial-literals)

  (:objects
    bl1_sl1 - room
    bl1_sl1_ac1 bl1_sl1_ac2 bl1_sl1_ac3 bl1_sl1_ac4 - air-conditioner
    bl1_sl1_l1 bl1_sl1_l2 bl1_sl1_l3 bl1_sl1_l4 - light
  )

  (:init
    (= (occupancy bl1_sl1) 10)

    (at 7
      (operating_hour))

    (= (occupancy bl1_sl1) 0)

    (at 12
      (not (operating_hour)))
  )

  (:goal
    (and
      (end_class bl1_sl1 bl1_sl1_ac1)
      (end_class bl1_sl1 bl1_sl1_ac2)
      (end_class bl1_sl1 bl1_sl1_ac3)
      (end_class bl1_sl1 bl1_sl1_ac4)
    )
  )
)