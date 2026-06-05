extends Node2D

@onready var area = $Area2D
@onready var sprite = $Sprite2D
@onready var door = get_parent().get_node("Puerta")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area.monitoring = true
	print("Boton preparado")


func _physics_process(delta):
	var objeto_encima = false

	for body in area.get_overlapping_bodies():
		if body != self:
			objeto_encima = true
			break

	if objeto_encima:
		sprite.texture = preload("res://sprites/boton_pulsed_negro.png")
		door.abrir_puerta()
	else:
		sprite.texture = preload("res://sprites/boton_nopulsed_negro.png")
		door.cerrar_puerta()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
