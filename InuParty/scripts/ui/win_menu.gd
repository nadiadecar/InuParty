tool
extends CanvasLayer

onready var restart_btn = $VBoxContainer/Reiniciar

func _ready() -> void:
	restart_btn.connect("pressed", self, "_on_restart_pressed")

func _on_restart_pressed():
	get_tree().change_scene("res://scenes/stages/stage1.tscn")
