extends Node2D

## Radians per second
@export var rotation_speed := 0.7
@export var wait_seconds := 0.5

@onready var _area := $Area2D


func _physics_process(delta: float) -> void:
	_area.rotate(-delta * rotation_speed)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.damage(1)


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	await get_tree().create_timer(wait_seconds).timeout
	$AnimationPlayer.play("spray")
