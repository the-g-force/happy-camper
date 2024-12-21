class_name Player
extends CharacterBody2D

@export var speed := 100

var health := 10

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
	health -= 1
	print(health)
	if health <= 0:
		print("you died")


func is_facing_right() -> bool:
	return _sprite.flip_h == false
