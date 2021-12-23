extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer = $WallTimer
var velocity = Vector2(0, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
func _physics_process(delta):
	var collision_info = move_and_collide(velocity * 1)
	if collision_info:
		var colObj = collision_info.get_collider()
		if colObj.is_in_group("destroyers"):
			print("DESTROYER")
			timer.set_wait_time( 0.05 )
			timer.connect("timeout", self, "_on_Timer_timeout")
			timer.start()


func _on_Timer_timeout():
	timer.stop()
	get_parent().remove_child(self)
