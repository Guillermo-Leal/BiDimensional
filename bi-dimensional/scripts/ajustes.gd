extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_volver_al_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/MenuPrincipal.tscn")


func _on_reset_prog_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/respuestaSeguridad.tscn")
