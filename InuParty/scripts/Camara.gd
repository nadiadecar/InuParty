extends Camera2D

export var velMov = 0.5
export var velZoom = 0.05
export var minZoom = 1
export var maxZoom = 5
export var margen = Vector2(80,40)

var objectives = []

onready var tamanoVent = get_viewport_rect().size

func add_objective(t): 
	if not t in objectives: 
		objectives.append(t)

func remove_objective(t): 
	if t in objectives:
		objectives.remove(t)

func _process(delta):
	if !objectives: 
		return 
		
	#mantener la camara centrada en los objetivos 
	var p = Vector2.ZERO
	for obj in objectives:
		p += obj.position
	p /= objectives.size()
	position = lerp(position, p, velMov) # se establece la posicion de la camara en el centro de los objetivos 
	
	#encontrando el zoom que tiene a todos los objetivos 
	var r = Rect2(position, Vector2.ONE)
	for obj in objectives: 
		r = r.expand(obj.position)
	#se añade el margen a cada lado de los objetivos
	r = r.grow_individual(margen.x, margen.y, 
							margen.x, margen.y)
	var d = max(r.size.x, r.size.y)
	var zoomFinal 
	if r.size.x > r.size.y * tamanoVent.aspect():
		zoomFinal = clamp(r.size.x / tamanoVent.x, minZoom, maxZoom)
	else: 
		zoomFinal = clamp(r.size.y / tamanoVent.y, minZoom, maxZoom)
	zoom = lerp(zoom, Vector2.ONE * zoomFinal, velZoom)
