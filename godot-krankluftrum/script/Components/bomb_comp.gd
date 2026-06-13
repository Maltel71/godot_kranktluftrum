extends Node2D
class_name Bomb

@export var Speed: float = 10.0
@export var Shrink_Speed: float = 5.0
@export var Deaccelerate: float = 8.0
@export var Shrink_Deaccelerate: float = 8.0
@export var shrink_amount: float = -0.001
@export var Bomb_Minimum_Size: float = 0.2
var current_speed: float
var direction: Vector2 = Vector2.UP
var current_shrink: float 
var size: Vector2 = Vector2(shrink_amount,shrink_amount)

func _ready() -> void:
	current_speed = Speed
	current_shrink = Shrink_Speed

func _physics_process(delta: float) -> void:
	position += direction * current_speed
	current_speed = move_toward(current_speed, 0, Deaccelerate * delta)
	current_shrink = move_toward(current_shrink, 0, Shrink_Deaccelerate * delta)
	scale += size * current_shrink
	if scale <= Vector2(Bomb_Minimum_Size,Bomb_Minimum_Size):
		queue_free()
