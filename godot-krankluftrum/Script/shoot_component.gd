extends Node2D
class_name ShootComp


#@export var Projectile_Layer = 
@export var Attack_Damage = 500000
@export var FireRate = 10
@export var BulletSpeed = 20
@export var BulletSpread = 10


func _on_hit_body_entered():
	if body.has_method("Damage"):
		body.Damage(Attack_Damage)
