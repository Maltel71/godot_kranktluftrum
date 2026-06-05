extends Area2D
class_name Projectile

@export_category("Bullet")
@export var Bullet_Speed: float = 300.0
@export var Damage: int = 10
@export var Bullet_Timer: float = 5.0


@export_category("Missile")
@export var is_missile: bool = false
@export var Missile_Inaccuracy: float = 5.0
var direction: Vector2 = Vector2.ZERO
var target: Node2D = null

func _ready() -> void:
	area_entered.connect(_on_area_entered)
func _on_area_entered(area):
	call_deferred("queue_free")

func _physics_process(delta: float) -> void:
	if is_missile and target != null:
		var steer = global_position.direction_to(target.global_position)
		direction = direction.lerp(steer, Missile_Inaccuracy * delta).normalized()
	Bullet_Timer -= delta
	position += direction * Bullet_Speed * delta
	if Bullet_Timer <= 0:
		call_deferred("queue_free")
