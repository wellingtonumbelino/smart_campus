(define (problem reduce-acs-on)
    (:domain smart_campus)

    (:objects
        room1 - room
        a1 a2 a3 a4 - air-conditioner
    )

    (:init
        (device-in-room room1 a1)
        (device-in-room room1 a2)
        (device-in-room room1 a3)
        (device-in-room room1 a4)
        (device-on room1 a1)
        (device-on room1 a2)
        (device-on room1 a3)
        (device-on room1 a4)
        (= (total-acs-in-room room1) 4)
        (= (acs-on-in-room room1) 4)
        (= (current-time) 18000000)
    )

    (:goal
        (and
            (<= (acs-on-in-room room1) 2)
        )
    )
)