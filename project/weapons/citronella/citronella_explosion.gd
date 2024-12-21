extends Area2D

func _ready() -> void:
	$CPUParticles2D.one_shot = true



func _on_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.damage(1)


func _on_cpu_particles_2d_finished() -> void:
	queue_free()
