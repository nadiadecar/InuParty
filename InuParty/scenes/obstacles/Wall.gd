extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var timer = $WallTimer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta) -> void:
	if $RayCast2D.is_colliding():
		var colObj = $RayCast2D.get_collider()
		print(colObj)
		if colObj.is_in_group("destroyers"):
			timer.set_wait_time( 0.5 )
			timer.connect("timeout", self, "_on_Timer_timeout")
			timer.start()

func _on_Timer_timeout():
	timer.stop()
	get_parent().remove_child(self)
