extends Area2D

@onready var door = get_parent().get_parent().get_node("MundoBlanco/Puerta")

func _on_body_entered(body):
	print("Llave conseguida")
	queue_free()
	door.abrir_puerta()
