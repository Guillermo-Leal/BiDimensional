extends CanvasLayer

func _ready() -> void:
	#Hace que la visibilidad base del menu sea false
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	#Al pulsar el boton de "pausar" si ya estaba pausado reanuda el juego si no lo pausa
	if Input.is_action_just_pressed("Pausar"):
		if get_tree().paused: 
			visible = false
			get_tree().paused = false
		else: 
			visible = true
			get_tree().paused = true
			

func _on_volver_al_menu_principal_pressed() -> void:
	#Despausa todo el juego para despues mandarte al menu de niveles
	visible = false
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/Niveles/Menus/Niveles.tscn")


func _on_continuar_pressed() -> void:
	#Reanuda el juego
	visible = false
	get_tree().paused = false
