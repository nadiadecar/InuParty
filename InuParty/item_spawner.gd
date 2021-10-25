extends Position2D

export (Array, PackedScene) var item_scenes # Las escenas precargadas de cada item
export var wait_time = 1.5                  # La frecuencia con que se revisa si hay un item válido (probablemente no sirva en su caso)

var current_item_node = null                # En esta variable se almacena el nodo que corresponde al item actual
var should_spawn_next = false               # Bool que indica si debería spawnear un objeto en el siguiente frame (ayuda a evitar bugs)

func _ready():
	var _err = $Spawn_timer.connect("timeout", self, "check_current_item") # Conecta el timer de cooldown, probablemente no te sea útil
	$Spawn_timer.wait_time = wait_time
	$Spawn_timer.start()
	call_deferred("spawn_item")            # Llamada al spawneo de un item

func spawn_item():
	var selected = ... # aquí iría algo para randomizar la aparición de items o lo que necesiten
	current_item_node = item_scenes[selected].instance()
	#set_item_properties() # opcional, podrías asignar variables de inicialización aquí si lo necesitas
	get_parent().add_child(current_item_node)
	current_item_node.global_position = global_position

#func set_item_properties():
#	...

func check_current_item():
	if not is_instance_valid(current_item_node):
		if should_spawn_next:
			spawn_item()
			should_spawn_next = false
		else:
			should_spawn_next = true
