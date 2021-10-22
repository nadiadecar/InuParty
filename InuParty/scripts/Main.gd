extends TextureRect

#const full = Rect2()
#const empty = Rect2()

onready var holder = $Holder

var item: Node = null setget set_item

func set_item(value):
	item = value
	var atlas = texture as AtlasTexture
	if item: 
		item.get_parent().remove_child(item)
		holder.add_child(item)
	#	atlas.region = full
	#else:
	#	atlas.reguin = empty

#func _ready() -> void: 
#	_update_slot()

#func _update_slot():
