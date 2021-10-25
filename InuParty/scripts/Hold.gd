extends "res://scripts/items/ItemsManager.gd"



""" 
func _physics_process(delta) -> void:	
	if Input.is_action_just_pressed("hold"):
		if hold:  #esto está horrible, pero se arreglará eventualmente 
			if "objectType" in actualItem:
				var actualType = actualItem.objectType  #Se guarda el tipo del objeto actual
				print(actualType + " con cosa")
				if "objectType" in hold:
					var hold_helper = hold.objectType #Se guarda el tipo del objet en hold
					print(hold_helper + " el helpeador")
					hold = itemDic[actualType].instance() #Se redefine el hold 
					print("hold: " + hold.objectType)
					
					#modificando el actualItem
					self.remove_child(actualItem)
					actualItem = itemDic[hold_helper].instance()
					self.add_child(actualItem)
					actualItem.position.x = get_parent().get_node("Player").get_node("Camera2D").global_position.x
					actualItem.global_position.y = global_position.y 
					
					#creando el hold
				
		else: 
			if "objectType" in actualItem:
				var actualType = actualItem.objectType  
				print(actualType + " vacío")
				
				hold = itemDic[actualType].instance()
				#self.add_child(hold)
				#hold.position.x = "hi" #################aiua
				#hold.global_position.y = global_position.y

"""
