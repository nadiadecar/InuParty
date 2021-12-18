extends ParallaxBackground

export (bool) var auto_scroll = true       # activar o desactivar, no muy útil en este caso pero xd
export (float) var auto_scroll_speed = -100  # velocidad con que se hace scroll

func _process(delta):
	if auto_scroll:
		scroll_offset.x += auto_scroll_speed * delta
