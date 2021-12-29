extends "res://scripts/items/generalItemScript.gd"
var objectType = "Bone"
var first_col = true

func exec_collision():
	var colObj = $RayCast2D.get_collider()
	if colObj.is_in_group("Inu"):
		animationPlayer.play("Active")
		first_col = false
		emit_signal("collision")
	else:
		if first_col:
			first_col = false
			animationPlayer.play("Inactive")
