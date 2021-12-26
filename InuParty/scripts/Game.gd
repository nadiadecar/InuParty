extends Node2D

func _ready():
	$CamaraMultiObjetivos.add_objective($Cat)
	$CamaraMultiObjetivos.add_objective($Player)

