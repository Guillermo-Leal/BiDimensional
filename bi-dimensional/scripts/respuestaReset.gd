extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#En caso de elegir no, te devuelve a la pantalla de ajustes.
func _on_respuesta_no_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/Ajustes.tscn")


#En el caso de elegir si, limpia el archivo json sobreescribiendolo con un diccionario vacio.
func _on_respuesta_si_pressed() -> void:
	SaveManager.save_data = {}
	SaveManager.save_data_to_file()
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/Ajustes.tscn")
