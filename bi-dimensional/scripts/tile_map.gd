extends TileMap

var invertido := false

func _input(event):
	if Input.is_action_just_pressed("change"):
		invertido = !invertido
		material.set_shader_parameter("invert", invertido)
