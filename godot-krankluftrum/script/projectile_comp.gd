extends Area2D
class_name Projectile

@export_category("Bullet")
@export var Bullet_Speed: float = 300.0
@export var Damage: int = 10
@export var Bullet_Timer: int = 5


@export_category("Missile")
@export var is_missile: bool = false

var direction: Vector2 = Vector2.ZERO
var target: Node2D = null

func _physics_process(delta: float) -> void:
	if is_missile and target != null:
		var steer = global_position.direction_to(target.global_position)
		direction = direction.lerp(steer, 5.0 * delta).normalized()

	position += direction * Bullet_Speed * delta
