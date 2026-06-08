extends Node2D
class_name Flare

@export var MIN_Speed: float = 4.0
@export var MAX_Speed: float = 5.0
@export var Delete_Timer: float = 0.0
@export var Deaccelerate: float = 8.0



var current_speed : float
var direction: Vector2 = Vector2.UP

func _ready() -> void:
	var Flare_Speed = randf_range(MAX_Speed, MIN_Speed)
	current_speed = Flare_Speed

func _process(delta: float) -> void:
	Delete_Timer -= delta
	if Delete_Timer <= 0.0:
		queue_free()
	position += direction * current_speed
	current_speed = move_toward(current_speed, 0, Deaccelerate * delta)
