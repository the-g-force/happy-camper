extends Area2D

@export var speed := 200
var direction : Vector2:
	set(value):
		direction = value.normalized()


func _physics_process(delta: float) -> void:
	position += speed *  direction * delta


func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.damage(1)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
