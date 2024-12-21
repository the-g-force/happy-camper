class_name SfxPlayer extends Node

const _STOMP_SOUNDS := [preload("res://sound/stomp.wav"), preload("res://sound/stomp2.wav")]

func play_smore_sound() -> void:
	_vary($SmorePickup)
	$SmorePickup.play()


func play_stomp_sound() -> void:
	_vary($StompSound)
	$StompSound.stream = _STOMP_SOUNDS.pick_random()
	$StompSound.play()
	

## Play the sound to make when the player gets hit
func play_hit_sound() -> void:
	_vary($HitSound)
	$HitSound.play()


func play_whiff_sound() -> void:
	_vary($WhiffSound)
	$WhiffSound.play()


func _vary(player : AudioStreamPlayer) -> void:
	player.pitch_scale = randfn(1.0,0.05)
