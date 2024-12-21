extends Node2D

@onready var _game_over_menu : Control = $HUD/GameOverMenu


func _on_enemy_spawner_game_ended() -> void:
	_game_over_menu.popup("You win!!!!")


func _on_player_died() -> void:
	_game_over_menu.popup("You lose :(")
