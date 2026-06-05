extends Node2D
class_name FlareComp


@export_category("Flare")
@export var flare_scene: PackedScene
@export var Flare_Ports: Array[Marker2D]



func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Flare"):
		_flare()

func _flare() -> void:
	if flare_scene == null:
		return

	var level_root = get_tree().current_scene
	for Ports in Flare_Ports:
		var Flare = flare_scene.instantiate()
		level_root.add_child(Flare)
		Flare.global_position = Ports.global_position
