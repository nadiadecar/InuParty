extends CanvasLayer


onready var start_button = $VBoxContainer/Start
onready var credits_button = $VBoxContainer/Credits
onready var quit_button = $VBoxContainer/Quit

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.connect("pressed", self, "on_start_pressed")
	credits_button.connect("pressed", self, "on_credits_pressed")
	quit_button.connect("pressed", self, "on_quit_pressed")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func on_start_pressed():
	get_tree().change_scene("res://scenes/ui/levelSelector.tscn")

func on_credits_pressed():
	get_tree().change_scene("res://scenes/ui/credits.tscn")
	
func on_quit_pressed():
	get_tree().quit()
