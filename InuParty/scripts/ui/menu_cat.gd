extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 0
var ACCELERATION = 1
var GRAVITY = 400


onready var playback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	var target_vel = 1
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	lineal_vel.y += GRAVITY * delta
	
	#ANIMATIONS
	playback.travel("Walk")
