extends Node2D
class_name FlareComp

@export_category("Flare")
@export var flare_scene: PackedScene
@export var Flare_Ports: Array[Marker2D]
@export var Projectile_Layer: int = 1
@export var Projectile_Mask: int = 1

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Flare"):
		_flare()

func _flare() -> void:
	if flare_scene == null:
		return


	for Ports in Flare_Ports:
		var level_root = get_tree().current_scene
		var Flare = flare_scene.instantiate()
		var some_angle = Ports.rotation_degrees
		level_root.add_child(Flare)
		Flare.global_position = Ports.global_position
		Flare.direction = Vector2.DOWN.rotated(some_angle)
		#Flare.collision_layer = 1 << (Projectile_Layer - 1)
		#Flare.collision_mask = 1 << (Projectile_Mask - 1)
