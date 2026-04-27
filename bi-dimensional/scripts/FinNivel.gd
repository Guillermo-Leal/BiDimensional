extends Node2D

@onready var puerta: Area2D = $MundoBlanco/Puerta
@onready var popup_victoria: Control = $Canvaslayer/PopupVictoria

# Called when the node enters the scene tree for the first time.
func _ready():
	puerta.nivel_completado.connect(_on_win)
	
func _on_volver_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/Niveles.tscn")
	
func _on_win():
	popup_victoria.visible = true
	
