extends Area2D

@onready var abrirpuerta = $"../../OpenDoor"
@onready var sprite = $Sprite2D
signal nivel_completado

func _ready(): #La puerta comienza sin estar activada, monitoring hace que se active la winzone.
	monitoring = false

func abrir_puerta(): #Al recoger la llave o pulsar el botón, la winzone se activa y se cambia su sprite.
	sprite.texture = preload("res://sprites/puerta_abierta.png")
	abrirpuerta.play()
	monitoring = true

func cerrar_puerta(): #En caso de que se suelte el boton, se desactiva y se cierra.
	sprite.texture = preload("res://sprites/puerta_cerrada.png")
	monitoring = false


func _on_body_entered(body: Node2D) -> void: #Winzone.
	print("Intentando entrar")
	if body.name == "fedeP":
		print("Has ganado")
		body.bloqueado = true  # Bloquea el personaje
		emit_signal("nivel_completado")
