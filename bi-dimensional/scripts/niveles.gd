extends Node2D

@onready var tutorial_completado: TextureRect = $Levels/Tutorial/tutorial_completado
@onready var nivel1_completado: TextureRect = $Levels/lvl1/nivel1_completado
@onready var nivel2_completado: TextureRect = $Levels/lvl2/nivel2_completado
@onready var nivel3_completado: TextureRect = $Levels/lvl3/nivel3_completado
@onready var nivel4_completado: TextureRect = $Levels/lvl4/nivel4_completado

func _ready()->void:
	tutorial_completado.visible = SaveManager.is_level_completed("res://scenes/Niveles/Tutorial/Tutorial.tscn")
	nivel1_completado.visible = SaveManager.is_level_completed("res://scenes/Niveles/Nivel1/Nivel1.tscn")
	nivel2_completado.visible = SaveManager.is_level_completed("res://scenes/Niveles/Nivel2/Nivel2.tscn")
	nivel3_completado.visible = SaveManager.is_level_completed("res://scenes/Niveles/Nivel3/Nivel3.tscn")
	nivel4_completado.visible = SaveManager.is_level_completed("res://scenes/Niveles/Nivel4/Nivel4.tscn")

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
