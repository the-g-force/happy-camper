extends Node2D

const NUMBER_OF_WEAPON_OPTIONS := 2

## All the weapons available in the game
const WEAPONS : Array[WeaponType] = [
	preload("res://weapons/citronella.tres"),
	preload("res://weapons/rock.tres"),
	preload("res://weapons/repellant.tres"),
	preload("res://weapons/shoe.tres"),
	preload("res://weapons/stomp.tres"),
]

var _enemies_killed := 0
var _upgrade_smore_thresholds := [5,10]
var _weapon_sequence : Array[WeaponType]= []

@onready var _player := $Player
@onready var _game_over_menu : Control = $HUD/GameOverMenu
@onready var _health_bar : ProgressBar = $HUD/HealthBar
@onready var _smore_label : Label = $HUD/SmoresLabel
@onready var _kill_label : Label = $HUD/PointLabel

func _ready() -> void:
	# Randomize the sequence of weapons that are available.
	_weapon_sequence.assign(WEAPONS)
	_weapon_sequence.shuffle()


func _process(_delta: float) -> void:
	# Debug keys!
	if Input.is_action_just_pressed("gain_smore"):
		_player.smores += 1


func _select_new_weapon() -> void:
	get_tree().paused = true
	var dialog := preload("res://ui/weapon_selection.tscn").instantiate()
	dialog.options = _weapon_sequence.slice(0, NUMBER_OF_WEAPON_OPTIONS)
	$HUD.add_child(dialog)
	var selection : WeaponType = await dialog.selected
	_player.add_child(selection.scene.instantiate())
	
	# Throw away all the options that were shown to the player.
	# Those options are gone forever
	for i in NUMBER_OF_WEAPON_OPTIONS:
		_weapon_sequence.remove_at(0)
	
	get_tree().paused = false


func _on_enemy_spawner_game_ended() -> void:
	_game_over_menu.popup("You win!!!!")


func _on_player_died() -> void:
	_game_over_menu.popup("You lose :(")


func _on_player_health_changed(new_health: int) -> void:
	_health_bar.value = new_health


func _on_player_smores_updated(new_smores: int) -> void:
	_smore_label.text = "S'mores: %d" % [new_smores]
	if not _upgrade_smore_thresholds.is_empty() \
		and _upgrade_smore_thresholds[0] == new_smores:
		_upgrade_smore_thresholds.remove_at(0)
		_select_new_weapon()


func _on_enemy_spawner_enemy_killed() -> void:
	_enemies_killed += 1
	_kill_label.text = "Bragging Rights: %d" % [_enemies_killed]
