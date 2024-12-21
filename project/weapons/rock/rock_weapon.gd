extends Node2D

const DIRECTIONS = [
	Vector2.UP, 
	Vector2.LEFT,
	Vector2.DOWN,
	Vector2.RIGHT, 
]

var _direction_index := 0

func _on_timer_timeout() -> void:
	var projectile := preload("res://weapons/rock/rock_projectile.tscn").instantiate()
	add_child(projectile)
	projectile.direction = DIRECTIONS[_direction_index]
	_direction_index = (_direction_index + 1) % DIRECTIONS.size()
