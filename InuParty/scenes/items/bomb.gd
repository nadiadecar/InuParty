extends "res://scripts/items/generalItemScript.gd"

onready var sprite = $Sprite

var objectType = "Bomb"
const shaderTime = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	var _twr = $ShaderColorH.connect("tween_completed", self, "_on_h_faded")

	$ShaderColorH.interpolate_property(sprite, "material:shader_param/color:h", sprite.get_material().get_shader_param("color").h, 0.5 - sprite.get_material().get_shader_param("color").h, shaderTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$ShaderColorH.start()

func _on_h_faded(_o, _k):
	$ShaderColorH.interpolate_property(sprite, "material:shader_param/color:h", sprite.get_material().get_shader_param("color").h, 0.5 - sprite.get_material().get_shader_param("color").h, shaderTime, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$ShaderColorH.start()
