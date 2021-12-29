extends Control

onready var progress_bar = $ProgressBar
onready var timer = $Timer
onready var label = $Label

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.wait_time = 120
	progress_bar.max_value = timer.wait_time
	timer.connect("timeout", self, "_on_Timer_timeout")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_left = timer.time_left
	progress_bar.value = time_left
	label.text = "%.2f" % time_left + " s"

func _on_Timer_timeout():
	get_tree().change_scene("res://scenes/ui/lose_menu.tscn")
