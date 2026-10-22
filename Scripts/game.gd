extends Node2D

var score : int = 0
var game_over : bool = false
@onready var score_text = $Score
@onready var bird = $Bird
@onready var gameover = $GameOver
@onready var game_sounds = $GameSounds
@export var pipe : PackedScene

func add_score():
	score += 1
	score_text.text = str(score)

func _on_timer_timeout() -> void:
	var new_pipe = pipe.instantiate()
	var random_y = randf_range(-250, 250)
	new_pipe.position = Vector2(784, random_y)
	new_pipe.passed_pipes.connect(add_score)
	add_child(new_pipe)

func _on_bird_body_entered(body: Node) -> void:
	if body.is_in_group("hit") and !game_over:
		game_sounds.play()
		bird.can_flap = false
		gameover.visible = true
		game_over = true
