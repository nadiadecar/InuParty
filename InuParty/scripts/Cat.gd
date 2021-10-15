extends KinematicBody2D

var lineal_vel = Vector2.ZERO
#var SPEED = 225
var SPEED = 0
var ACCELERATION = 2
var GRAVITY = 400

var NEAR_DISTANCE_THRESHOLD = 100
var FAR_DISTANCE_THRESHOLD = 1100

var player_distance

onready var playback = $AnimationTree.get("parameters/playback")
onready var player = get_parent().get_node("Player")

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	lineal_vel.x = move_toward(lineal_vel.x, SPEED, ACCELERATION)
	lineal_vel.y += GRAVITY * delta
	
	player_distance = abs(self.position.x - player.position.x)
	print("distancia perro y gato: ", player_distance)
	if (player_distance < NEAR_DISTANCE_THRESHOLD):
		#pass
		get_tree().change_scene("res://scenes/ui/win_menu.tscn")
