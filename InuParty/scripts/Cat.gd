extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 300
var ACCELERATION = 5
var GRAVITY = 400

var _facing_right = true

onready var playback = $AnimationTree.get("parameters/playback")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	pass
	
