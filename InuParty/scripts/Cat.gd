extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 180
var ACCELERATION = 1
var GRAVITY = 400

var NEAR_DISTANCE_THRESHOLD = 50
var FAR_DISTANCE_THRESHOLD = 2200

var player_distance

onready var playback = $AnimationTree.get("parameters/playback")
onready var player = get_parent().get_node("Player")
onready var timer = $WaterTimer

func _ready() -> void:
	$AnimationTree.active = true
	get_node("AnimationPlayer")

func _physics_process(delta) -> void:
	player_distance = self.position.x - player.position.x
	get_parent().get_parent().get_node("HUD").get_node("LabelMeters").text = "Distance: " + String(round(player_distance)) + " meters"
	if (player_distance >= FAR_DISTANCE_THRESHOLD):
		get_tree().change_scene("res://scenes/ui/lose_menu.tscn")
	
	lineal_vel = move_and_slide(lineal_vel, Vector2.UP)
	var target_vel = 1
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	lineal_vel.y += GRAVITY * delta
	
	if (player.cat_plane and player.position.x >= self.position.x - NEAR_DISTANCE_THRESHOLD):
		var winTimer = Timer.new()
		winTimer.set_wait_time(4)
		winTimer.connect("timeout", self, "_on_winTimer_timeout")
		add_child(winTimer)
		winTimer.start()
		player.SPEED = 0
		self.SPEED = 0
		
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

func _on_winTimer_timeout():
	get_tree().change_scene("res://scenes/ui/win_menu.tscn")
