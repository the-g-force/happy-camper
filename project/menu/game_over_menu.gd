extends Control

@onready var _message_label : Label = $MessageLabel


func _ready() -> void:
	hide()


func popup(message: String) -> void:
	get_tree().paused = true ## is this OK?
	_message_label.text = message
	show()


func _on_play_again_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://world.tscn")


func _on_main_menu_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu/main_menu.tscn")
