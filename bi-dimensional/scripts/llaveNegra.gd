extends Area2D

@onready var door = get_parent().get_parent().get_node("MundoBlanco/Puerta")

#Detecta si un cuerpo ha entrado en la hitbox de la llave
func _on_body_entered(body):
	queue_free()
	door.abrir_puerta()
	
