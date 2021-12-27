extends CanvasLayer

onready var creditsLabel = $CreditsLabel
onready var back_button = $VBoxContainer/CanvasLayer2/back
onready var tween = $Tween

func _ready():
	back_button.connect("pressed", self, "on_back_pressed")
	tween.interpolate_property(creditsLabel, "rect_position",
		Vector2(0, 750), Vector2(0, 700 - creditsLabel.rect_size.y), 7.5,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func on_back_pressed():
	get_tree().change_scene("res://scenes/ui/main_menu.tscn")
