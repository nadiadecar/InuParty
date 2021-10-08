extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 225
var ACCELERATION = 2
var GRAVITY = 400

var _facing_right = true

onready var playback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	lineal_vel.x = move_toward(lineal_vel.x, SPEED, ACCELERATION)
	lineal_vel.y += GRAVITY * delta
	

