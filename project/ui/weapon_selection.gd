extends Control

var options : Array[WeaponType]

signal selected(weapon_type:WeaponType)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	assert(not options.is_empty())
	for weapon_type in options:
		var column := VBoxContainer.new()
		column.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		var info_box := preload("res://ui/weapon_info.tscn").instantiate()
		info_box.weapon_type = weapon_type
		info_box.size_flags_vertical = Control.SIZE_EXPAND_FILL
		column.add_child(info_box)
		
		var button := Button.new()
		button.text = "Select"
		button.pressed.connect(func():
			selected.emit(weapon_type)
			queue_free()
		)
		column.add_child(button)
		
		%HorizontalBox.add_child(column)
	
	
