extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 15
var GRAVITY = 10
var plane = "cat"
var holded = false

onready var playback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")


func _physics_process(delta) -> void:
	if not holded:
		lineal_vel.y += GRAVITY * delta
		
		var x_strength = Input.get_action_strength("right_obj") - Input.get_action_strength("left_obj")
		position.x += x_strength * SPEED
		
		# ANIMATIONS
		if Input.is_action_just_pressed("fast_fall"):
			lineal_vel.y += GRAVITY * 50
			
		if $RayCast2D.is_colliding():
			playback.travel("Active")
			get_parent()._on_Timer_timeout()
		

		if Input.is_action_just_pressed("dog_plane") and plane == "cat":
			position.y = 200
			plane = "dog"
			
		if Input.is_action_just_pressed("cat_plane") and plane == "dog":
			position.y = 0
			plane = "cat"
		
		lineal_vel = move_and_slide(lineal_vel)
	else:
		self.collision_layer = 0
