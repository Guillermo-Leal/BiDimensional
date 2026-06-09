extends Area2D

@onready var abrirpuerta = $"../../OpenDoor"
@onready var sprite = $Sprite2D
signal nivel_completado

func _ready():
	monitoring = false

func abrir_puerta():
	sprite.texture = preload("res://sprites/puerta_abierta.png")
	abrirpuerta.play()
	monitoring = true

func cerrar_puerta():
	sprite.texture = preload("res://sprites/puerta_cerrada.png")
	monitoring = false


func _on_body_entered(body: Node2D) -> void:
	print("Intentando entrar")
	if body.name == "fedeP":
		print("Has ganado")
		body.bloqueado = true  # Bloquea el personaje
		emit_signal("nivel_completado")
