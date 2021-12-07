extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text" 
onready var level1_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer/level1
onready var level2_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer2/level2
onready var level3_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer3/level3
onready var level4_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer4/level4
onready var level5_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer5/level5
onready var level6_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer6/level6
onready var level7_button = $VBoxContainer/CanvasLayer/VBoxContainer/CanvasLayer7/level7
onready var back_button = $VBoxContainer/CanvasLayer2/back

# Called when the node enters the scene tree for the first time.
func _ready():
	level1_button.connect("pressed", self, "on_level1_pressed")
	level2_button.connect("pressed", self, "on_level2_pressed")
	level3_button.connect("pressed", self, "on_level3_pressed")
	level4_button.connect("pressed", self, "on_level4_pressed")
	level5_button.connect("pressed", self, "on_level5_pressed")
	level6_button.connect("pressed", self, "on_level6_pressed")
	level7_button.connect("pressed", self, "on_level7_pressed")
	back_button.connect("pressed", self, "on_back_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func on_level1_pressed():
	get_tree().change_scene("res://scenes/stages/stage1.tscn")
	
func on_level2_pressed():
	get_tree().change_scene("res://scenes/stages/stage2.tscn")
	
func on_level3_pressed():
	get_tree().change_scene("res://scenes/stages/stage3.tscn")
	
func on_level4_pressed():
	get_tree().change_scene("res://scenes/stages/stage4.tscn")
	
func on_level5_pressed():
	get_tree().change_scene("res://scenes/stages/stage5.tscn")

func on_level6_pressed():
	get_tree().change_scene("res://scenes/stages/stage6.tscn")
	
func on_level7_pressed():
	get_tree().change_scene("res://scenes/stages/stage7.tscn")
	
func on_back_pressed():
	get_tree().change_scene("res://scenes/ui/main_menu.tscn")
