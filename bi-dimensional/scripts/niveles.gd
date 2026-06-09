extends Node2D

@onready var tutorial_completado: TextureRect = $Levels/Tutorial/tutorial_completado

func _ready()->void:
	tutorial_completado.visible = SaveManager.is_level_completed("res://scenes/Niveles/Tutorial/Tutorial.tscn")

func _on_tutorial_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Tutorial/Tutorial.tscn")

func _on_volver_al_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/MenuPrincipal.tscn")

func _on_lvl_1_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Nivel1/Nivel1.tscn")
	
func _on_lvl_2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Nivel2/Nivel2.tscn")

func _on_lvl_3_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Nivel3/Nivel3.tscn")


func _on_lvl_4_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Nivel4/Nivel4.tscn")
