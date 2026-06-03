extends Node2D
class_name HealthComp

@export var MAX_HEALTH := 100
var current_health : int

signal Died
signal Health_Changed
func _ready():
	current_health = MAX_HEALTH
	emit_signal("Health_Changed")

func Damage(Hit: HIT):
	current_health = max(0, current_health - Hit.Damage)
	emit_signal("Health_Changed")

func _process(delta: float) -> void:
	if current_health <= 0:
		emit_signal("Died")
