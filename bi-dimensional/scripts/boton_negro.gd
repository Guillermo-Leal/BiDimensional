extends Node2D

@onready var area = $Area2D
@onready var sprite = $Sprite2D
@onready var door = get_parent().get_node("Puerta")
@onready var ray_cast_2d: RayCast2D = $RayCast2D
var estaba_pulsado := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.monitoring = true
	print("Boton preparado")


func _physics_process(delta):
	var objeto_encima = ray_cast_2d.is_colliding()

	if objeto_encima and not estaba_pulsado:
		estaba_pulsado = true
		sprite.texture = preload("res://sprites/boton_pulsed_negro.png")
		door.abrir_puerta()
	elif not objeto_encima and estaba_pulsado:
		estaba_pulsado = false
		sprite.texture = preload("res://sprites/boton_nopulsed_negro.png")
		door.cerrar_puerta()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
