extends "res://scripts/items/generalItemScript.gd"

onready var animationPlayer = $AnimationPlayer
var objectType = "Bone"

func _ready():
	animationPlayer.play("Fall")

func _physics_process(delta) -> void:
	if $RayCast2D.is_colliding():
		var colObj = $RayCast2D.get_collider()
		if colObj.is_in_group("Inu"):
			animationPlayer.play("Active")
		else:
			animationPlayer.play("Inactive")
