extends Node
class_name HealthComp

@export var MAX_HEALTH := 100
var Health : int

signal Died
signal Health_Changed
func _ready():
	Health = MAX_HEALTH
	emit_signal("Health_Changed")
	
func Damage(Hit: HIT):
	Health -= Hit.Attack_Damage
	emit_signal("Health_Changed")
	
	
	if Health <= 0:
		emit_signal("Died")
