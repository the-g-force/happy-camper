class_name Enemy extends CharacterBody2D

signal died

@export var target : Player
@export var speed := 200

var _health := 1.0


func _physics_process(delta: float) -> void:
	var angle := global_position.angle_to_point(target.global_position)
	move_and_collide(Vector2.RIGHT.rotated(angle) * speed * delta)


func _on_hit_area_body_entered(body: Node2D) -> void:
	if body is Player:
		body.damage()
		queue_free()


## Apply this much damage to the enemy.
## If it takes more damage than its health, it dies.
func damage(amount:int) -> void:
	_health -= amount
	if _health <= 0:
		queue_free()
		_drop_smore()
		died.emit()


func _drop_smore() -> void:
	var smore := preload("res://smore/smore.tscn").instantiate()
	get_parent().call_deferred("add_child", smore)
	smore.global_position = global_position


func _draw() -> void:
	draw_circle(Vector2.ZERO, 16, Color.DEEP_PINK)
