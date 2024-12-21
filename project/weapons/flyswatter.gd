extends Node2D

@onready var _area := $Area2D
@onready var _collision := $Area2D/CollisionShape2D

func _ready() -> void:
	_deactivate()
	

func _activate() -> void:
	_area.visible = true
	_collision.disabled = false


func _deactivate() -> void:
	_area.visible = false
	_collision.disabled = true


func _on_active_timer_timeout() -> void:
	_deactivate()
	$WaitTimer.start()


func _on_wait_timer_timeout() -> void:
	_activate()
	$ActiveTimer.start()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.damage(1)
