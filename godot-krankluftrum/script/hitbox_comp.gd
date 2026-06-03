extends Area2D
class_name HitboxComp

@export var HealthComponent : HealthComp

func Damage(Hit: HIT):
	if HealthComp:
		HealthComponent.Damage(Hit)
