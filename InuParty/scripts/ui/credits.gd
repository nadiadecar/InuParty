extends CanvasLayer

onready var creditLabels = $CreditLabels

func _ready():
	for label in creditLabels.get_children():
		label.get("custom_fonts/font").set_size(80)
