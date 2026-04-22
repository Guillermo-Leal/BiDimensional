extends TileMap

var invertido := false

func toggle_color():
	invertido = !invertido
	if material:
		material.set_shader_parameter("invert", invertido)

func resetColor():
	invertido = false
	if material:
		material.set_shader_parameter("invert", invertido)

func _on_win_zone_body_entered(body: Node2D) -> void:
	if body.name == "fedeP":
		print("Felicidades has ganado.")
