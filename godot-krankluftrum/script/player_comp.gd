extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var input_dir = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Upp"):
		input_dir.y -= 1
	if Input.is_action_pressed("Down"):
		input_dir.y += 1
	if Input.is_action_pressed("Left"):
		input_dir.x -= 1
	if Input.is_action_pressed("Right"):
		input_dir.x += 1
	
	input_dir = input_dir.normalized()
	
	var direction = (transform * Vector2(input_dir.x, input_dir.y)).normalized()
