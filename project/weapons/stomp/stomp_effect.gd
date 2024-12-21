extends Node2D


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.damage(1)


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	queue_free()


func play_sound() -> void:
	sfx.play_stomp_sound()
