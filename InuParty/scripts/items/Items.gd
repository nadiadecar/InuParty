extends Node2D
const Thunder = preload("res://scenes/items/thunder.tscn")
const Water = preload("res://scenes/items/water.tscn")
const Bomb = preload("res://scenes/items/bomb.tscn")
const Bone = preload("res://scenes/items/Bone.tscn")
const Thor = preload("res://scenes/items/objeto_thor.tscn")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var bombItem= Bomb.instance()
	self.add_child(bombItem)
	bombItem.global_position = global_position
	
func _physics_process(delta) -> void:
	if Input.is_action_just_pressed("fast_fall"):
		var thunderItem= Thunder.instance()
		self.add_child(thunderItem)
		thunderItem.global_position = global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
