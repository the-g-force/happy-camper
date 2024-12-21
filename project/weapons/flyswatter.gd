extends Node2D

var _player : Player

@onready var _area := $Area2D
@onready var _collision := $Area2D/CollisionShape2D


func _ready() -> void:
	_deactivate()
	_player = get_parent()
	

func _activate() -> void:
	# Turn the flyswatter the way the player is facing
	scale.x = 1 if _player.is_facing_right() else -1
	
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
