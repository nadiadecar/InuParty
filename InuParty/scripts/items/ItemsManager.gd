extends Node2D
const Thunder = preload("res://scenes/items/thunder.tscn")
const Water = preload("res://scenes/items/water.tscn")
const Bomb = preload("res://scenes/items/bomb.tscn")
const Bone = preload("res://scenes/items/Bone.tscn")
const Thor = preload("res://scenes/items/objeto_thor.tscn")

var itemList = [Thunder, Bomb, Water, Bone, Thor]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var actualItem
onready var timer = $Timer
var hold

func _ready():
	itemList.shuffle()
	print(itemList)
	actualItem= itemList[0].instance()
	self.add_child(actualItem)
	actualItem.global_position = global_position
	
	
func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("fast_fall"):
		timer.set_wait_time( 1.5 )
		timer.connect("timeout", self, "_on_Timer_timeout")
		timer.start()
		
	if Input.is_action_just_pressed("change_obj"):
		timer.set_wait_time( 0.05 )
		timer.connect("timeout", self, "_on_Timer_timeout")
		timer.start()
		
#	if actualItem.get_node("RayCast2D").get_collider() != null:
#		timer.set_wait_time( 1.5 )
#		timer.connect("timeout", self, "_on_Timer_timeout")
#		timer.start()
#		print("jeje")
		
func _on_Timer_timeout():
	timer.stop()
	self.remove_child(actualItem)
	itemList.shuffle()
	actualItem= itemList[0].instance()
	self.add_child(actualItem)
	actualItem.position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x
	actualItem.global_position.y = global_position.y 


func _hold_Item():
	if Input.is_action_just_pressed("hold"):
		if is_instance_valid(hold):  
			pass
			
		
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
