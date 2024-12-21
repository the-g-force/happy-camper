extends Area2D


func _on_body_entered(_body: Node2D) -> void:
	print("You ate a smore")
	queue_free()


func _draw() -> void:
	draw_circle(Vector2.ZERO, 8, Color.NAVAJO_WHITE)
