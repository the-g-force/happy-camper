extends Node2D

@export var player : Player


func _spawn_enemy() -> void:
	var at := Vector2.RIGHT.rotated(randf() * TAU) * 400 + player.global_position
	
	var enemy := preload("res://enemy/enemy.tscn").instantiate()
	add_child(enemy)
	enemy.target = player
	enemy.global_position = at


func _on_spawn_timer_timeout() -> void:
	_spawn_enemy()
