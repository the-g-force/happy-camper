class_name Enemy extends CharacterBody2D

signal died

const IMAGE_NAMES := ["ant", "spider", "bee", "fly"]
const ANIMATION_NAME := "insect"

@export var target : Player
@export var speed := 200

var _health := 1.0

@onready var _sprite : AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	_load_animation()
	_sprite.play(ANIMATION_NAME)


func _physics_process(delta: float) -> void:
	_sprite.flip_h = target.global_position.x < global_position.x
	
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


func _load_animation() -> void:
	var source : Texture2D = load("res://enemy/images/%s.png" % [IMAGE_NAMES.pick_random()])
	
	var atlas_texture_1 := AtlasTexture.new()
	atlas_texture_1.atlas = source
	atlas_texture_1.region = Rect2(Vector2.ZERO, Vector2.ONE * 16)
	
	var atlas_texture_2 := AtlasTexture.new()
	atlas_texture_2.atlas = source
	atlas_texture_2.region = Rect2(Vector2(0, 16), Vector2.ONE * 16)
	
	var spriteframes := SpriteFrames.new()
	spriteframes.add_animation(ANIMATION_NAME)
	spriteframes.add_frame(ANIMATION_NAME, atlas_texture_1)
	spriteframes.add_frame(ANIMATION_NAME, atlas_texture_2)
	
	_sprite.sprite_frames = spriteframes
