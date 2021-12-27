extends KinematicBody2D


onready var timer = $ConeTimer
var velocity = Vector2(0, 0)

func _ready():
	timer.set_wait_time( 0.05 )
	timer.connect("timeout", self, "_on_Timer_timeout")	


func _physics_process(delta):
	var collision_info = move_and_collide(velocity * 1)
	if collision_info:
		var colObj = collision_info.get_collider()
		if colObj.is_in_group("destroyers"):
			timer.start()


func _on_Timer_timeout():
	timer.stop()
	get_parent().remove_child(self)
