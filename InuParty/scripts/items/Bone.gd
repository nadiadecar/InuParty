extends "res://scripts/items/generalItemScript.gd"

var objectType = "Bone"

func _physics_process(delta) -> void:
	if $RayCast2D.is_colliding():
		var colObj = $RayCast2D.get_collider()
		if colObj.is_in_group("Inu"):
			playback.travel("Active")
		else:

			playback.travel("Inactive")
