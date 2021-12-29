tool
extends CanvasLayer

onready var backmenu_btn = $VBoxContainer/BackMenu

func _ready() -> void:
	backmenu_btn.connect("pressed", self, "_on_backmenu_pressed")

func _on_backmenu_pressed():
	get_tree().change_scene("res://scenes/ui/levelSelector.tscn")
