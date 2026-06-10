extends Control



func _ready() -> void:
	pass


func _on_volver_al_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/MenuPrincipal.tscn")


func _on_reset_prog_pressed() -> void:
	#Reseteo de todos los datos del archivo de guardado
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/respuestaSeguridad.tscn")
