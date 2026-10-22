extends Node2D

@export var move_speed = 10
@onready var score_sound = $ScoreSound
signal passed_pipes

func _process(delta: float) -> void:
	position.x -= move_speed * delta

func _on_score_box_body_entered(body: Node2D) -> void:
	score_sound.play()
	passed_pipes.emit()
