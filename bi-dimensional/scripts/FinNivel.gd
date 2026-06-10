extends Node2D
@onready var nivel = $LevelMusic
@onready var puerta: Area2D = $MundoBlanco/Puerta
@onready var popup_victoria: Control = $Canvaslayer/PopupVictoria


func _ready():
	nivel.play()
	puerta.nivel_completado.connect(_on_win)

#Volver al menu de niveles
func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/Niveles.tscn")
	
#Funcion que guarda en el archivo json de guardado que el nivel se ha completado
func _on_win():
	var level_id = scene_file_path
	SaveManager.complete_level(level_id)
	popup_victoria.visible = true
	
