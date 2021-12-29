extends Node2D

onready var popup = $HUD/Popup

func _process(delta):
	if Input.is_action_just_pressed("pause_game") and not get_tree().paused:
		get_tree().paused = true
		popup.show()

	elif Input.is_action_just_pressed("pause_game") and get_tree().paused:
		popup.hide()
		get_tree().paused = false
