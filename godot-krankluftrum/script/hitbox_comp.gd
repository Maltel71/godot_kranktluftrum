extends Area2D
class_name HitboxComp

@export var HealthComponent : HealthComp

func Damage(amount: int):
	if HealthComponent:
		HealthComponent.Damage(amount)

func _ready() -> void:
	var area = area_entered
	if area.has_method(Damage):
		HealthComponent.Damage(area.Damage)
