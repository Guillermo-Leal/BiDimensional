extends Node2D

@onready var area = $Area2D
@onready var sprite = $Sprite2D
@onready var door = get_parent().get_node("Puerta")
var estaba_pulsado := false
@onready var ray_cast_2d: RayCast2D = $RayCast2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.monitoring = true
	


func _physics_process(delta):
	#Raycast para detectar objeto encima del boton
	var objeto_encima = ray_cast_2d.is_colliding()
	
	if objeto_encima and not estaba_pulsado:
		estaba_pulsado = true
		sprite.texture = preload("res://sprites/boton_pulsed_blanco.png") #Cuando nota que hay un objeto encima cambia
		door.abrir_puerta()
	elif not objeto_encima and estaba_pulsado:
		estaba_pulsado = false
		sprite.texture = preload("res://sprites/boton_nopulsed_blanco.png") #Vuelve al sprite base cuando deja de ver el objeto encima
		door.cerrar_puerta()

func _process(delta: float) -> void:
	pass
