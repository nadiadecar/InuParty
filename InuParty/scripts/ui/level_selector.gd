extends CanvasLayer


onready var level1_button = $VBoxContainer/GridContainer/level1
onready var level2_button = $VBoxContainer/GridContainer/level2
onready var level3_button = $VBoxContainer/GridContainer/level3
onready var level4_button = $VBoxContainer/GridContainer/level4
onready var level5_button = $VBoxContainer/GridContainer/level5
onready var level6_button = $VBoxContainer/GridContainer/level6
onready var level7_button = $VBoxContainer/GridContainer/level7
onready var level8_button = $VBoxContainer/GridContainer/level8
onready var tutorial_button = $VBoxContainer/tutorial
onready var back_button = $VBoxContainer/back

var _1

func _ready():
	_1 = level1_button.connect("pressed", self, "on_level1_pressed")
	_1 = level2_button.connect("pressed", self, "on_level2_pressed")
	_1 = level3_button.connect("pressed", self, "on_level3_pressed")
	_1 = level4_button.connect("pressed", self, "on_level4_pressed")
	_1 = level5_button.connect("pressed", self, "on_level5_pressed")
	_1 = level6_button.connect("pressed", self, "on_level6_pressed")
	_1 = level7_button.connect("pressed", self, "on_level7_pressed")
	_1 = level8_button.connect("pressed", self, "on_level8_pressed")
	_1 = tutorial_button.connect("pressed", self, "on_tutorial_pressed")
	_1 = back_button.connect("pressed", self, "on_back_pressed")


func on_level1_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage1.tscn")
	
func on_level2_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage2.tscn")
	
func on_level3_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage3.tscn")
	
func on_level4_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage4.tscn")
	
func on_level5_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage5.tscn")

func on_level6_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage6.tscn")
	
func on_level7_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage7.tscn")
	
func on_level8_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/stage8.tscn")
	
func on_tutorial_pressed():
	_1 = get_tree().change_scene("res://scenes/stages/tutorial.tscn")

func on_back_pressed():
	_1 = get_tree().change_scene("res://scenes/ui/main_menu.tscn")
