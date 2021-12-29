extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 15
var GRAVITY = 10
var plane = "cat"
var holded = false
var velocity = Vector2(0, 0)
onready var timer = get_parent().get_node("Timer")
var first_collision = true


onready var animationPlayer = $AnimationPlayer

func _ready() -> void:
	animationPlayer.play("Fall")
	if is_instance_valid(timer):
		timer.set_wait_time( 1.0 )
		timer.connect("timeout", get_parent(), "_on_Timer_timeout")


func _physics_process(delta) -> void:
	if not holded:
		lineal_vel.y += GRAVITY * delta
		
		var x_strength = Input.get_action_strength("right_obj") - Input.get_action_strength("left_obj")
		position.x += x_strength * SPEED
		
		# ANIMATIONS
		if Input.is_action_just_pressed("fast_fall"):
			lineal_vel.y += GRAVITY * 50
			
		if $RayCast2D.is_colliding() and first_collision:
			first_collision = false
			exec_animation()
			timer.start()
		

		if Input.is_action_just_pressed("dog_plane") and plane == "cat":
			position.y = 200
			plane = "dog"
			
		if Input.is_action_just_pressed("cat_plane") and plane == "dog":
			position.y = 0
			plane = "cat"
		
		lineal_vel = move_and_slide(lineal_vel)
	else:
		self.collision_layer = 0
		
func exec_animation():
	animationPlayer.play("Active")
