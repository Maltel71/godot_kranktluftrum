extends Area2D
class_name HitboxComp

@export var HealthComponent : HealthComp


func Damage(amount: int):
	if HealthComponent:
		HealthComponent.Damage(amount)

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area is Projectile:
		HealthComponent.Damage(area.Damage)
