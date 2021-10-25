extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 180
var ACCELERATION = 1
var GRAVITY = 400

var NEAR_DISTANCE_THRESHOLD = 100
var FAR_DISTANCE_THRESHOLD = 1100

var player_distance

onready var playback = $AnimationTree.get("parameters/playback")
onready var player = get_parent().get_node("Player")
onready var timer = $WaterTimer

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	var target_vel = 1
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	lineal_vel.y += GRAVITY * delta
	
	player_distance = abs(self.position.x - player.position.x)
	#print("distancia perro y gato: ", player_distance)
	if (player_distance < NEAR_DISTANCE_THRESHOLD):
		#pass
		get_tree().change_scene("res://scenes/ui/win_menu.tscn")
		
	if $RayCast2D.is_colliding():
		var colObj = $RayCast2D.get_collider()
		print(colObj)
		if colObj.is_in_group("cat_nerfs"):
			SPEED = 0
			lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
			timer.set_wait_time( 5 )
			timer.connect("timeout", self, "_on_Timer_timeout")
			timer.start()
	
	#ANIMATIONS
	if abs(lineal_vel.x) <= 0:
		playback.travel("Idle")
	if 0 < abs(lineal_vel.x):
		playback.travel("Walk")

func _on_Timer_timeout():
	timer.stop()
	SPEED = 180
	var target_vel = 1
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
