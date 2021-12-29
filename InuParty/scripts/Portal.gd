extends Area2D

onready var player = get_parent().get_parent().get_node("Player")

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_on_body_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body : KinematicBody2D):
	if body.is_in_group("player"):
		print("Jugador toca el portal")
		body.change_plane()
		get_parent().get_parent().get_parent().get_node("Musica/portal").play()
