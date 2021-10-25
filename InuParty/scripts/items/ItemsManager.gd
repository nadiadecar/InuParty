extends Node2D
const Thunder = preload("res://scenes/items/thunder.tscn")
const Water = preload("res://scenes/items/water.tscn")
const Bomb = preload("res://scenes/items/bomb.tscn")
const Bone = preload("res://scenes/items/Bone.tscn")
const Thor = preload("res://scenes/items/objeto_thor.tscn")

var itemDic = {"Thunder":Thunder, "Bomb":Bomb, "Water": Water, "Bone": Bone, "Thor":Thor}
var itemList = ["Thunder","Bomb","Water","Bone","Thor"]
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var actualItem
onready var timer = $Timer
var hold

func _ready():
	itemList.shuffle()
	print(itemList)
	actualItem= itemDic[itemList[0]].instance()
	self.add_child(actualItem)
	actualItem.global_position = global_position
	
	
func _physics_process(delta) -> void:
	if hold: 
		hold.global_position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x - 400
		hold.global_position.y = global_position.y
	
	if Input.is_action_just_pressed("fast_fall"):
		timer.set_wait_time( 1.5 )
		timer.connect("timeout", self, "_on_Timer_timeout")
		timer.start()
		
	if Input.is_action_just_pressed("change_obj"):
		timer.set_wait_time( 0.05 )
		timer.connect("timeout", self, "_on_Timer_timeout")
		timer.start()
	
	if Input.is_action_just_pressed("hold"):
		if hold:  #esto está horrible, pero se arreglará eventualmente 
			if "objectType" in actualItem:
				var actualType = actualItem.objectType  #Se guarda el tipo del objeto actual
				if "objectType" in hold:
					var hold_helper = hold.objectType #Se guarda el tipo del objet en hold
					
					#modificando el actualItem
					self.remove_child(actualItem)
					actualItem = itemDic[hold_helper].instance()
					self.add_child(actualItem)
					actualItem.position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x
					actualItem.global_position.y = global_position.y 
					
					#creando el hold
					get_parent().get_node("Holder").remove_child(hold)
					hold = itemDic[actualType].instance()
					get_parent().get_node("Holder").add_child(hold)
					hold.position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x - 400
					hold.global_position.y = global_position.y
					
				
		else: 
			if "objectType" in actualItem:
				var actualType = actualItem.objectType  
				
				hold = itemDic[actualType].instance()
				get_parent().get_node("Holder").add_child(hold)
				hold.position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x - 400
				hold.global_position.y = global_position.y 
				
				
#	if actualItem.get_node("RayCast2D").get_collider() != null:
#		timer.set_wait_time( 1.5 )
#		timer.connect("timeout", self, "_on_Timer_timeout")
#		timer.start()
#		print("jeje")
		
func _on_Timer_timeout():
	timer.stop()
	self.remove_child(actualItem)
	itemList.shuffle()
	actualItem= itemDic[itemList[0]].instance()
	self.add_child(actualItem)
	actualItem.position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x
	actualItem.global_position.y = global_position.y 

	
		
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
