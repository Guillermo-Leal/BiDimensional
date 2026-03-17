extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print("jaja puto malo")
	if body.has_method("die"):
		body.die()
