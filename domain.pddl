(define (domain smart-campus)
  (:requirements :strips :typing)

  (:types
    air_conditioning
    device
    light
    person
    projector
    quantity
    room
    without_people
  )

  (:predicates
    (device-on ?d - device)
    (high-occupation ?gt - greater_than_20 ?r - room)
    (in-room ?d - device ?r - room)
    (low-occupation ?r - room ?q - quantity)
    (mid-occupation ?r - room)
    (no-occupation ?r - room ?q - quantity)
    (less_than_10 ?q1 - quantity)
    (greater_10_less_20 ?q2 - quantity)
    (greater_than_20 ?q3 - quantity)
  )
)

; como parâmetro podemos ter o ?q ?q_less_ten ?q_greater_ten_less_twenty ?q_greater_twenty - quantity