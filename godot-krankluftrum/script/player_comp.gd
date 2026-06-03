extends CharacterBody2D


@export var SPEED = 100


func _physics_process(delta: float) -> void:
	var input_dir = Vector2.ZERO
	if Input.is_action_pressed("Upp"):
		input_dir.y -= 1

	if Input.is_action_pressed("Down"):
		input_dir.y += 1

	if Input.is_action_pressed("Left"):
		input_dir.x -= 1

	if Input.is_action_pressed("Right"):
		input_dir.x += 1

	
	input_dir = input_dir.normalized()
	
	var direction = (Vector2(input_dir.x, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = 0
		velocity.y = 0
	move_and_slide()
