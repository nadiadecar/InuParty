extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 300
var ACCELERATION = 5
var GRAVITY = 400

var _facing_right = true

onready var playback = $AnimationTree.get("parameters/playback")
#onready var cat_collision = get_parent().get_node("Cat/Area2D")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")
	
	#cat_collision.connect("body_entered", self, "_on_cat_collision")

func _physics_process(delta) -> void:
	# MOVIMIENTO
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	lineal_vel.y += GRAVITY * delta
	
	var on_floor = is_on_floor()
	
	var target_vel = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	
	if on_floor and Input.is_action_just_pressed("jump"):
		lineal_vel.y = -SPEED
	
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right") and _facing_right:
		_facing_right = false
		scale.x = -2.5
		
	if Input.is_action_pressed("right") and not Input.is_action_pressed("left") and not _facing_right:
		_facing_right = true
		scale.x = -2.5
		
	# ANIMATIONS
	if on_floor:
		if abs(lineal_vel.x) <= 0:
			playback.travel("Idle")
		if 0 < abs(lineal_vel.x) and abs(lineal_vel.x) < 300:
			playback.travel("Walk")
		if 300 <= abs(lineal_vel.x):
			playback.travel("Run")
	else:
			playback.travel("Jump")

"""
func _on_cat_collision(body):
	if body.is_in_group("player"):
		print("wiiiiii")
"""
