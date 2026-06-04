extends CharacterBody2D
class_name EnemyComp

enum EnemyType { Basic, Missile_Launcher, Heli }

@export var ShootComponent : ShootComp
@export var Enemy_Type: EnemyType = EnemyType.Basic
@export var FireAttempt: float = 2
@export var Detection_Zone : Area2D
@export var Missile_Turret : Node2D

var player_in_range: bool = false
var _cooldown: float = 0.0

func _ready() -> void:
	Detection_Zone.body_entered.connect(_on_body_entered)
	Detection_Zone.body_exited.connect(_on_body_exited)
func _on_body_entered(body):
		if body.is_in_group("Player"):
			player_in_range = true
			print("player_Entered")
func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false
		print("Player left :( ")

func _process(delta: float) -> void:
	_cooldown -= delta
	if player_in_range and _cooldown <= 0.0:
		ShootComponent.enemy_try_fire()
		_cooldown = 1.0 / FireAttempt
