extends Node2D

@export var bomb_scene: PackedScene
@export var Release_Point: Array[Marker2D]
@export var Projectile_Layer: int = 1
@export var Projectile_Mask: int = 1
@export var FireRate: float = 10.0

var _cooldown: float = 0.0

func _physics_process(delta: float) -> void:
	_cooldown -= delta
	if Input.is_action_just_pressed("Bomb") and _cooldown <= 0.0:
		_bomb()
		print("mobmed")
	_cooldown = 1.0 / FireRate

func _bomb() -> void:
	if bomb_scene == null:
		return

	var level_root = get_tree().current_scene

	for RP in Release_Point:
		var bomb = bomb_scene.instantiate()
		level_root.add_child(bomb)
		bomb.global_position = RP.global_position
		#bomb.collision_layer = 1 << (Projectile_Layer - 1)
		#bomb.collision_mask = 1 << (Projectile_Mask - 1)
