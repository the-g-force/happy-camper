extends Node2D

@export var swing_duration := 0.5

@onready var _arm := $Arm
@onready var _collision_shape := $Arm/Area2D/CollisionShape2D
@onready var _swing_timer : Timer = $Timer


func _ready() -> void:
	_deactivate()


func _on_timer_timeout() -> void:
	_activate()
	await _swing_shoe()
	_deactivate()


func _swing_shoe() -> void:
	sfx.play_shoe_sound()
	var start := randf_range(0,TAU)
	_arm.rotation = start
	await create_tween()\
		.tween_property(_arm, "rotation", start - PI/2, swing_duration)\
		.finished


func _activate() -> void:
	_arm.visible = true
	_collision_shape.disabled = false


func _deactivate() -> void:
	_arm.visible = false
	_collision_shape.disabled = true
	_swing_timer.start()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.damage(1)
