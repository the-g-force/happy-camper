class_name SfxPlayer extends Node

const _STOMP_SOUNDS := [preload("res://sound/stomp.wav"), preload("res://sound/stomp2.wav")]

func play_smore_sound() -> void:
	$SmorePickup.play()


func play_stomp_sound() -> void:
	$StompSound.stream = _STOMP_SOUNDS.pick_random()
	$StompSound.play()
	

## Play the sound to make when the player gets hit
func play_hit_sound() -> void:
	$HitSound.play()
