extends Node
class_name HitboxComp

@export var HealthComp : HealthComp

func Damage(Hit: HIT):
	if HealthComp:
		HealthComp.Damage(Hit)
