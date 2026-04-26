extends Area2D

@onready var door = get_parent().get_node("Puerta")
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _on_body_entered(body):
	print("Llave conseguida")
	queue_free()
	door.abrir_puerta()
	
