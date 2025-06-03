(define (domain smart-campus)
  (:requirements :strips :typing :fluents)

  (:types
    air_conditioning
    light
    projector
    room
  )

  (:predicates
    (device ?d)
    (device-on ?d - device)
    (in-room ?d - device ?r - room)
  )

  (:functions
    (total-energy-used)
  )

  ; pesquisar como monitorar quantas pessoas tem em sala

  ; monitoro -> avalio -> executo

  (:action turn_on_light
      :parameters (?r - room
                   ?l - light)
      :precondition (and (device ?l) (in-room ?l ?r))
      :effect (and (device-on ?l))
  )

  (:action turn_off_light
      :parameters (?r - room
                   ?l - light)
      :precondition (and (device ?l)
                    (device-on ?l))
      :effect (and (not (device-on ?l)))
  )

  (:action turn_off_all_lights_in_room_petti
      :parameters (?r - room
                   ?l1 - light
                   ?l2 - light)
      :precondition (and (no-occupation ?r)
                    (device ?l1)
                    (device ?l2)
                    (device-on ?l1)
                    (device-on ?l2))
      :effect (and (not (device-on ?l1))
              (not (device-on ?l2)))
  )

  (:action turn_on_all_lights_in_room_pet_ti
      :parameters (?r - room
                   ?l1 - light
                   ?l2 - light)
      :precondition (and (high-occupation ?r)
                         (device ?l1)
                         (device ?l2)
                         (device-on ?l1)
                         (device-on ?l2))
      :effect (and (device-on ?l1)
                   (device-on ?l2))
  )
)

; como parâmetro podemos ter o ?q ?q_less_ten ?q_greater_ten_less_twenty ?q_greater_twenty - quantity