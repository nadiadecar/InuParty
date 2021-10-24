extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 300
var ACCELERATION = 5
var GRAVITY = 10
var plane = "cat"

onready var playback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")


func _physics_process(delta) -> void:
	
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	lineal_vel.y += GRAVITY * delta
	var on_floor = is_on_floor()
	
	var target_vel = Input.get_action_strength("right_obj") - Input.get_action_strength("left_obj")
	
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	
	# ANIMATIONS
	if Input.is_action_just_pressed("fast_fall"):
		lineal_vel.y += GRAVITY * 50
		
	if $RayCast2D.is_colliding():
		var colObj = $RayCast2D.get_collider()
		if colObj.is_in_group("Inu"):
			playback.travel("Active")
		else:
			playback.travel("Inactive")

			

	if Input.is_action_just_pressed("dog_plane") and plane == "cat":
		position.y = 180
		plane = "dog"
		
	if Input.is_action_just_pressed("cat_plane") and plane == "dog":
		position.y = 0
		plane = "cat"

