extends Popup

func _ready():
	$VBoxContainer/Button1.connect("pressed", self, "on_Button1_pressed")
	$VBoxContainer/Button2.connect("pressed", self, "on_Button2_pressed")

func on_Button1_pressed():
	self.hide()
	get_tree().paused = false
	
func on_Button2_pressed():
	self.hide()
	get_tree().paused = false
	get_tree().change_scene("res://scenes/ui/main_menu.tscn")
