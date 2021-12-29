tool
extends CanvasLayer

onready var restart_btn = $VBoxContainer/Pause
onready var backmenu_btn = $VBoxContainer/BackMenu

func _ready() -> void:
	restart_btn.connect("pressed", self, "_on_restart_pressed")
	backmenu_btn.connect("pressed", self, "_on_backmenu_pressed")

func _on_restart_pressed():
	get_tree().change_scene("res://scenes/stages/stage1.tscn")

func _on_backmenu_pressed():
	get_tree().change_scene("res://scenes/ui/levelSelector.tscn")
