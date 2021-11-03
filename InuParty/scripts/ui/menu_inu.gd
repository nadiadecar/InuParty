extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 0
var ACCELERATION = 1
var GRAVITY = 400

var _facing_right = true

var cat_plane = false

onready var playback = $AnimationTree.get("parameters/playback")
onready var timer = $VelocityTimer

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	# MOVIMIENTO
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	lineal_vel.y += GRAVITY * delta
	
	var on_floor = is_on_floor()
	
	var target_vel = 1
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	
		
	# ANIMATIONS
	if on_floor:
		playback.travel("Walk")
