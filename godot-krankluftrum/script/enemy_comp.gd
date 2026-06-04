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
	return
func Shoot():
	ShootComponent.enemy_try_fire()
	match Enemy_Type:
		EnemyType.Basic:
			return
		EnemyType.Missile_Launcher:
			return
		EnemyType.Heli:
			return
func _process(delta: float) -> void:
	_cooldown -= delta
