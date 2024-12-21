extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.smores += 1
	sfx.play_smore_sound()
	queue_free()
