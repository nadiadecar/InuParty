extends KinematicBody2D

var lineal_vel = Vector2.ZERO
var SPEED = 200
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
	
	if $RayCast2D.is_colliding():
		var colObj = $RayCast2D.get_collider()
		print(colObj)
		if colObj.is_in_group("dog_boosters"):
			SPEED = 250
			ACCELERATION = 2
			lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
			timer.set_wait_time( 10 )
			timer.connect("timeout", self, "_on_Timer_timeout")
			timer.start()
	
	if on_floor and Input.is_action_just_pressed("jump"):
		lineal_vel.y = -SPEED
		get_parent().get_parent().get_node("Musica/jump").play()
		lineal_vel.x = max(0, lineal_vel.x - 75) # el perrito reduce su velocidad al saltar, se prioriza uso de objetos
	
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
		if 0 < abs(lineal_vel.x) and abs(lineal_vel.x) < 240:
			playback.travel("Walk")
		if 250 <= abs(lineal_vel.x):
			playback.travel("Run")
	else:
			playback.travel("Jump")


func change_plane():
	print("Cambiando plano")
	cat_plane = not cat_plane
	if cat_plane == true:
		self.position.y = -315
	else:
		self.position.y = 100
		
func _on_Timer_timeout():
	timer.stop()
	SPEED = 200
	ACCELERATION = 1
	var target_vel = 1
	lineal_vel.x = move_toward(lineal_vel.x, target_vel * SPEED, ACCELERATION)
	
	
