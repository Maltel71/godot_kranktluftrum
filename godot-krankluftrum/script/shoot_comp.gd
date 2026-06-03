extends Node2D
class_name ShootComp


@export var Projectile_Layer = int()
@export var FireRate = 10
@export var BulletSpread = 10
@export var barrels: Array[Marker2D]

var _cooldown: float = 0.0
#var Bullet = bullet_scene.instantiate()
#Bullet.collision_layer = 1 << (Projectile_Layer - 1)
#add_child(Bullet)

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Shoot"):
		print("FIRE")
		return
