extends Control

var weapon_type : WeaponType

func _ready() -> void:
	assert(weapon_type!=null)
	%NameLabel.text = weapon_type.name
	%InfoLabel.text = weapon_type.description
