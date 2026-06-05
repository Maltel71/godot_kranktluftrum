extends Node2D
class_name Flare

@export var Flare_Speed: float = 10.0
@export var Delete_Timer: float = 0.0

var current_speed : float

func _process(delta: float) -> void:
	Delete_Timer -= delta
	if Delete_Timer <= 0.0:
		queue_free()
