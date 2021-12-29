extends Node2D
const Thunder = preload("res://scenes/items/thunder.tscn")
const Water = preload("res://scenes/items/water.tscn")
const Bomb = preload("res://scenes/items/bomb.tscn")
const Bone = preload("res://scenes/items/Bone.tscn")
const Thor = preload("res://scenes/items/objeto_thor.tscn")

var itemDic = {"Thunder":Thunder, "Bomb":Bomb, "Water": Water, "Bone": Bone}
var itemList = ["Thunder","Bomb","Water","Bone"]

var actualItem
onready var timer = $Timer
const shaderTime = 0.5
var hold
export (Color) var color

func _ready():
	timer.connect("timeout", self, "_on_Timer_timeout")
	randomize()
	actualItem = itemDic[itemList[randi() % itemList.size()]].instance()
	self.add_child(actualItem)
	actualItem.connect("collision",self,"admCollision")
	actualItem.global_position = global_position
	
	var _twr = $ShaderColorH.connect("tween_completed", self, "_on_h_faded")
	_set_Material_Shader_toSprite()


func _physics_process(_delta) -> void:
	var container = get_parent().get_node("HolderBox").get_node("container")
	
	#Solo funciona para el caso de stage1-Camara
	var camara = get_parent().get_node("CamaraMultiObjetivos")
	var pos_cam = camara.global_position
	var tam_cam = camara.zoom

	# print(pos_cam, tam_cam)
	container.global_position.x = pos_cam.x - (500 * tam_cam.x)
	container.global_position.y = pos_cam.y - (275 * tam_cam.y)
	
	if hold: 
		hold.global_position.x = container.global_position.x
		hold.global_position.y = container.global_position.y
		if hold.objectType == "Thor": 
			hold.global_position.y += 20
	
	if Input.is_action_just_pressed("fast_fall"):
		timer.set_wait_time( 1.5 )
		timer.start()
		
	if Input.is_action_just_pressed("change_obj"):
		timer.set_wait_time( 0.05 )
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
					actualItem.connect("collision",self,"admCollision")
					actualItem.position.x = camara.global_position.x
					actualItem.global_position.y = global_position.y 
					
					#creando el hold
					get_parent().get_node("Holder").remove_child(hold)
					hold = itemDic[actualType].instance()
					get_parent().get_node("Holder").add_child(hold)
					hold.position.x = camara.global_position.x - 400
					hold.global_position.y = global_position.y
					hold.holded = true
					
				
		else: 
			if "objectType" in actualItem:
				var actualType = actualItem.objectType  
				
				hold = itemDic[actualType].instance()
				get_parent().get_node("Holder").add_child(hold)
				hold.position.x = camara.global_position.x - 400
				hold.global_position.y = global_position.y
				hold.holded = true
		
		#Se cambia el objeto que está cayendo 
		timer.set_wait_time( 0.05 )
		timer.start()
		
		
#	if actualItem.get_node("RayCast2D").get_collider() != null:
#		timer.set_wait_time( 1.5 )
#		timer.connect("timeout", self, "_on_Timer_timeout")
#		timer.start()
#		print("jeje")
		
func admCollision():
	var main_node = get_parent().get_parent()
	if "objectType" in actualItem:
		var actualType = actualItem.objectType
		var efecto = main_node.get_node(actualType)
		efecto.play()
				

func _on_Timer_timeout():
	timer.stop()
	self.remove_child(actualItem)
	actualItem= itemDic[itemList[randi() % itemList.size()]].instance()
	self.add_child(actualItem)
	actualItem.connect("collision",self,"admCollision")
	_set_Material_Shader_toSprite()
	actualItem.position.x = get_parent().get_node("CamaraMultiObjetivos").global_position.x
	actualItem.global_position.y = global_position.y

func _set_Material_Shader_toSprite() -> void:
	actualItem.use_parent_material = true
	actualItem.get_node("Sprite").use_parent_material = true
	
	$ShaderColorH.reset_all()
	$ShaderColorH.interpolate_property(self, "material:shader_param/color:h", self.material.get_shader_param("color").h, 0.5 - self.material.get_shader_param("color").h, shaderTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$ShaderColorH.start()
	

func _on_h_faded(_o, _k):
	$ShaderColorH.interpolate_property(self, "material:shader_param/color:h", self.material.get_shader_param("color").h, 0.5 - self.material.get_shader_param("color").h, shaderTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$ShaderColorH.start()
