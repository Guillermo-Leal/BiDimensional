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
