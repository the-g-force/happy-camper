extends Node2D


## The global position where this is headed
@export var destination : Vector2

@export var time_to_destination := 0.5

func _ready() -> void:
	await create_tween()\
		.tween_property(
			self, "global_position", destination, time_to_destination
		)\
		.finished
	var explosion := preload("res://weapons/citronella/citronella_explosion.tscn").instantiate()
	get_parent().add_child(explosion)
	explosion.global_position = global_position
	queue_free()
