extends KinematicBody2D


onready var tween = $Tween
var velocity = Vector2(0, 0)

func _ready():
	tween.connect("tween_all_completed", self, "_on_tween_completed")
	tween.interpolate_property($TextureProgress, "value",
					0, 100, 0.1, Tween.TRANS_LINEAR)


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * 1)
	if collision_info:
		var colObj = collision_info.get_collider()
		if colObj.is_in_group("destroyers"):
			$TextureProgress.show()
			tween.start()


func _on_tween_completed():
	queue_free()
