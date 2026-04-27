extends Node2D



func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Tutorial/Tutorial.tscn")

func _on_volver_al_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/MenuPrincipal.tscn")

func _on_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Nivel1/PantallaEjemplo.tscn")
	
func _on_lvl_2_pressed() -> void:
	print("WIP")

func _on_lvl_3_pressed() -> void:
	print("WIP")
