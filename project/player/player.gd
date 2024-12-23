class_name Player
extends CharacterBody2D

signal died
signal health_changed(new_health: int)
signal smores_updated(new_smores: int)

@export var speed := 100

var health := 30
var smores := 0 :
	set(value):
		smores = value
		smores_updated.emit(smores)

@onready var _sprite := $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down").normalized()
	if direction.is_zero_approx():
		_sprite.stop()
	else:
		_sprite.play("default")
	if direction.x < 0:
		_sprite.flip_h = true
	elif direction.x > 0:
		_sprite.flip_h = false
	
	var motion := direction * speed
	move_and_collide(motion * delta)


func damage() -> void:
	sfx.play_hit_sound()
	health -= 1
	health_changed.emit(health)
	if health <= 0:
		died.emit()


func is_facing_right() -> bool:
	return _sprite.flip_h == false
