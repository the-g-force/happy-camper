extends Node2D

@export var min_range := 0
@export var max_range := 32 * 4

func _on_timer_timeout() -> void:
	var stomp := preload("res://weapons/stomp/stomp_effect.tscn").instantiate()
	get_parent().add_child(stomp)
	var distance := randf_range(min_range, max_range)
	var angle := randf_range(0,TAU)
	stomp.global_position = get_parent().global_position + Vector2(distance,0).rotated(angle)
