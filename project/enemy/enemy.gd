extends CharacterBody2D

@export var target : Player
@export var speed := 300

func _physics_process(delta: float) -> void:
	var angle := global_position.angle_to_point(target.global_position)
	move_and_collide(Vector2.RIGHT.rotated(angle) * speed * delta)
