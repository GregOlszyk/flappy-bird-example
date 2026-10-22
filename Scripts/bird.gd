extends RigidBody2D

@export var flap_power = 10
@onready var flap_sound = $FlapSound
var can_flap : bool = true

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("flap") and can_flap:
		linear_velocity.y = -flap_power
		flap_sound.play() 
		
