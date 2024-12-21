extends CharacterBody2D

@export var target : Player
@export var speed := 200


func _physics_process(delta: float) -> void:
	var angle := global_position.angle_to_point(target.global_position)
	move_and_collide(Vector2.RIGHT.rotated(angle) * speed * delta)


func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.damage()
