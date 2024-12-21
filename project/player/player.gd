extends CharacterBody2D

@export var speed := 300


func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down").normalized()
	move_and_collide(direction * speed * delta)
