extends CanvasLayer

onready var back_button = $back
onready var left = $LeftRight/A
onready var right = $LeftRight/D
onready var up = $UpDown/W
onready var down = $UpDown/S
onready var escape = $ESCAPE
onready var space = $SPACE
onready var fastfall = $I
onready var nextitem = $O
onready var hold = $P

onready var inputs = [["left_obj", left], ["right_obj", right], ["cat_plane", up],
["dog_plane", down], ["fast_fall", fastfall], ["change_obj", nextitem],
["hold", hold], ["pause_game", escape], ["jump", space]]

var _1

func _ready():
	_1 = back_button.connect("pressed", self, "on_back_pressed")

func __check_input(input):
	var action = input[0]
	var sprite = input[1]
	if Input.is_action_just_pressed(action):
		sprite.modulate = "#6c6c6c"
	if Input.is_action_just_released(action):
		sprite.modulate = "#ffffff"

func _process(delta):
	for input in inputs:
		__check_input(input)

func on_back_pressed():
	_1 = get_tree().change_scene("res://scenes/ui/main_menu.tscn")
