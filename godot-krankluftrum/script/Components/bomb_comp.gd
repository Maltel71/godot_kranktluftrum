extends Node
class_name Bomb

@export var Speed: float = 10.0
@export var Shrink_Speed: float = 5.0

var current_speed: float
var direction: Vector2 = Vector2.UP


func _ready() -> void:
	current_speed = Speed


func _physics_process(delta: float) -> void:
	current_speed -= delta
	#position += direction * current_speed
