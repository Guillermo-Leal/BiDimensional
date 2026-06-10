extends Node

const SAVE_PATH = "user://save_data.json"
var save_data: Dictionary = {}

func _ready() -> void:
	# Carga el guardado al iniciar
	load_data() 

func load_data() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		save_data = {}
		return # Si no hay archivo, diccionario vacío
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	save_data = JSON.parse_string(file.get_as_text()) # JSON -> Diccionario
	file.close()

func save_data_to_file() -> void:
	# Diccionario -> JSON
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(save_data))
	file.close()
	

func complete_level(level_id: String) -> void:
	save_data[level_id] = {"completed": true}
	save_data_to_file()
	# Marca el nivel como completado y guarda

func is_level_completed(level_id: String) -> bool:
	return save_data.has(level_id) and save_data[level_id]["completed"]
	# Devuelve true si el nivel está completado
