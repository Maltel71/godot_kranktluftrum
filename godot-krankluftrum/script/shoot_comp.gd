extends Node2D
class_name ShootComp

enum ShootMode { FIXED, AIMED, MISSILE }

@export var bullet_scene: PackedScene
@export var barrels: Array[Marker2D]
@export var shoot_mode: ShootMode = ShootMode.FIXED
@export var FireRate: float = 10.0
@export var Projectile_Layer: int = 1
@export var is_player: bool = false

var _cooldown: float = 0.0

func _physics_process(delta: float) -> void:
	_cooldown -= delta

	if is_player:
		if Input.is_action_pressed("Shoot") and _cooldown <= 0.0:
			_fire()
			_cooldown = 1.0 / FireRate

func enemy_try_fire() -> void:
	if _cooldown <= 0.0:
		_fire()
		_cooldown = 1.0 / FireRate

func _fire() -> void:
	if bullet_scene == null:
		return

	var player = get_tree().get_first_node_in_group("player")
	var level_root = get_tree().current_scene

	for barrel in barrels:
		var bullet = bullet_scene.instantiate()
		level_root.add_child(bullet)
		bullet.global_position = barrel.global_position

		match shoot_mode:
			ShootMode.FIXED:
				bullet.direction = Vector2.UP
			ShootMode.AIMED:
				if player != null:
					bullet.direction = barrel.global_position.direction_to(player.global_position)
				else:
					bullet.direction = Vector2.UP
			ShootMode.MISSILE:
				bullet.is_missile = true
				bullet.direction = Vector2.UP
				if player != null:
					bullet.target = player

		bullet.collision_layer = 1 << (Projectile_Layer - 1)
