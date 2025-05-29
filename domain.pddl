(define (domain smart-campus)
  (:requirements :strips :typing)

  (:types
    air_conditioning
    device
    light
    projector
    quantity
    room
  )

  (:predicates
    (device-on ?d - device)
    (in-room ?d - device ?r - room)
    (no-occupation ?r - room ?q - quantity)
    (low-occupation ?r - room ?q - quantity)
    (mid-occupation ?r - room ?q - quantity)
    (high-occupation ?r - room ?q - quantity)
  )

  (:action action_name
      :parameters ()
      :precondition (and )
      :effect (and )
  )
  
)

; como parâmetro podemos ter o ?q ?q_less_ten ?q_greater_ten_less_twenty ?q_greater_twenty - quantity