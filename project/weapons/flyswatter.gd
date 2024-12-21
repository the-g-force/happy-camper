extends Node2D

@onready var _area := $Area2D

func _ready() -> void:
	_area.visible = false


func _on_timer_timeout() -> void:
	_area.visible = not _area.visible


func _on_active_timer_timeout() -> void:
	_area.visible = false
	$WaitTimer.start()


func _on_wait_timer_timeout() -> void:
	_area.visible = true
	$ActiveTimer.start()
