; --Plan #00001--------------------------
; -- Discretisation: 0.100----------------
; ---------------------------------------
0.100: ( start_campus_operating) [0.000]
0.101: ( turn_on_light_during_class bl1_sl1 bl1_sl1_light1) [0.200]
0.102: ( turn_on_light_during_class bl1_sl1 bl1_sl1_light2) [0.200]
0.103: ( turn_on_air_conditioner_during_class bl1_sl1 bl1_sl1_ac1) [0.200]
0.104: ( turn_on_air_conditioner_during_class bl1_sl1 bl1_sl1_ac2) [0.200]
0.305: ( turn_off_light_when_occupancy_zero bl1_sl1 bl1_sl1_light1) [0.000]
0.306: ( turn_off_light_when_occupancy_zero bl1_sl1 bl1_sl1_light2) [0.000]
0.307: ( turn_off_air_conditioner_when_occupancy_zero bl1_sl1 bl1_sl1_ac1) [0.000]
0.308: ( turn_off_air_conditioner_when_occupancy_zero bl1_sl1 bl1_sl1_ac2) [0.000]
; ---------------------------------------
; --Plan duration: 0.308, weight: 0003----
; ---------------------------------------
