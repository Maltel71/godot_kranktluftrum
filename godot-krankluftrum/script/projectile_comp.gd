extends Area2D
class_name Projectile


@export_category("Bullet")
@export var Bullet_Speed := int()
@export var Damage = int()






@export_category("Missile")
@export var is_missile = bool()
@export var direction = Vector2()


func _physics_process(delta: float) -> void:
	return
