extends Node2D

@export var player : Player
## the number of enemies spawned per second
@export var escalation_curve : Curve
## the duration over which the escalation curve is traversed
@export var game_length := 60.0

var _game_time := 0.0

@onready var _spawn_timer : Timer = $SpawnTimer


func _process(delta: float) -> void:
	_game_time += delta


func _spawn_enemy() -> void:
	var at := Vector2.RIGHT.rotated(randf() * TAU) * 400 + player.global_position
	
	var enemy := preload("res://enemy/enemy.tscn").instantiate()
	add_child(enemy)
	enemy.target = player
	enemy.global_position = at


func _on_spawn_timer_timeout() -> void:
	_spawn_enemy()
	_spawn_timer.start(_get_spawn_time())


## returns time until next spawn
func _get_spawn_time() -> float:
	return 1.0 / escalation_curve.sample(_game_time / game_length)
