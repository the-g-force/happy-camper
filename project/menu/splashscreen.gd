extends Control


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		get_tree().change_scene_to_file("res://menu/main_menu.tscn")
