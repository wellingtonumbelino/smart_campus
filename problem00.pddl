(define (problem turn_off_ac_s1)
  (:domain smart_campus)
  (:objects
    s1 - room
    ac1 - air-conditioner
    o1 - occupancy
  )
  (:init
    (device-in-room ac1 s1)
    (in-use ac1)
    (= (occupied o1) 1)
  )
  (:goal
    (not (in-use ac1))
  )
)