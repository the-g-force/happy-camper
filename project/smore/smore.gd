extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.smores += 1
	queue_free()


func _draw() -> void:
	draw_circle(Vector2.ZERO, 8, Color.NAVAJO_WHITE)
