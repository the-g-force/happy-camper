class_name Player
extends CharacterBody2D

@export var speed := 300

var health := 10


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down").normalized()
	move_and_collide(direction * speed * delta)


func damage() -> void:
	health -= 1
	print(health)
	if health <= 0:
		print("you died")
