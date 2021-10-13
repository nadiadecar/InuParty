extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 300
var ACCELERATION = 5
var GRAVITY = 400

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var playback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")


func _physics_process(delta) -> void:
	# ANIMATIONS
	if Input.is_action_just_pressed("enter"):
		playback.travel("Active")

