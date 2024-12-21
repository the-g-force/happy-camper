extends Node2D

var _enemies_killed := 0

@onready var _game_over_menu : Control = $HUD/GameOverMenu
@onready var _health_bar : ProgressBar = $HUD/HealthBar
@onready var _smore_label : Label = $HUD/SmoresLabel
@onready var _kill_label : Label = $HUD/PointLabel


func _on_enemy_spawner_game_ended() -> void:
	_game_over_menu.popup("You win!!!!")


func _on_player_died() -> void:
	_game_over_menu.popup("You lose :(")


func _on_player_health_changed(new_health: int) -> void:
	_health_bar.value = new_health


func _on_player_smores_updated(new_smores: int) -> void:
	_smore_label.text = "S'mores: %d" % [new_smores]


func _on_enemy_spawner_enemy_killed() -> void:
	_enemies_killed += 1
	_kill_label.text = "Bragging Rights: %d" % [_enemies_killed]
