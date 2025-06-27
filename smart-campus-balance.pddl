(define (problem smart-campus-balance)
  (:domain smart_campus)
  (:objects
    sala1 - room
    o1 - occupancy
    a1 a2 - air-conditioning
    s1 - switch
  )

  (:init
    (has-device sala1 a1)
    (has-device sala1 a2)
    (has-switch sala1 s1)
    (= (occupied o1) 18) ; Exemplo: 18 pessoas
    (= (total-energy-consumed) 0)
    (off a1)
    (off a2)
    (not (switch-on s1))
  )

  (:goal (and
    (switch-on s1)
    (forall (?ac - air-conditioning)
      (imply (in-use ?ac) (has-device sala1 ?ac))
    )
  ))

  (:metric minimize (total-energy-consumed))
)
