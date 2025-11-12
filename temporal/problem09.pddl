(define (problem turn-on-bl1-sl1)
  (:domain smart_campus)

  (:requirements :strips :typing :fluents :durative-actions :negative-preconditions :timed-initial-literals :timed-initial-literals)

  (:objects
    bl1_sl1 - room
    bl1_sl1_ac1 bl1_sl1_ac2 bl1_sl1_ac3 bl1_sl1_ac4 - device
  )

  (:init
    (device_at bl1_sl1 bl1_sl1_ac1)
    (device_at bl1_sl1 bl1_sl1_ac2)
    (device_at bl1_sl1 bl1_sl1_ac3)
    (device_at bl1_sl1 bl1_sl1_ac4)

    (= (current_time) 0)
    (= (occupancy bl1_sl1) 0)

    (at 7
      (= (current_time) 7))

    (at 8
      (= (occupancy bl1_sl1) 6))
    (at 12
      (= (occupancy bl1_sl1) 0))

    (at 7
      (operating_hour))
    (at 22
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
