(define (problem smart-campus-instance)
  (:domain smart_campus)
  (:objects
    sala1 - room
    o1 - occupancy
    a1 a2 - air-conditioning
    p1 - projector
    s1 - switch
  )

  (:init
    (has-device sala1 a1)
    (has-device sala1 a2)
    (has-device sala1 p1)
    (has-switch sala1 s1)
    (= (occupied o1) 12)
    (= (total-energy-consumed) 0)
    (off a1)
    (off a2)
    (off p1)
    (not (switch-on s1))
  )

  (:goal (and
    (switch-on s1)
    (in-use a1)
    (not (in-use a2))
    (in-use p1)
  ))

  (:metric minimize (total-energy-consumed))
)
