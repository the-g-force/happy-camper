extends Node2D

var _range := 64

func _on_timer_timeout() -> void:
	var bomb := preload("res://weapons/citronella/citronella_bomb.tscn").instantiate()
	bomb.destination = global_position + Vector2(0,_range).rotated(randf_range(0,TAU))
	add_child(bomb)
