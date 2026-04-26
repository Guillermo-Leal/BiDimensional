extends RigidBody2D
var textura_blanca = preload("res://sprites/caja_Blanco.png")
var textura_negra = preload("res://sprites/caja_Negro.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

#func _input(event):
	#if event.is_action_pressed("change"):
		#toggle_color()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#var invertido := false
#
#func toggle_color():
	#var sprite = $Sprite2D
	#
	#invertido = !invertido
	#if invertido:
		#sprite.texture = textura_negra
	#else:
		#sprite.texture = textura_blanca
#
#func resetColor():
	#var sprite = $Sprite2D
	#invertido = false
	#sprite.texture = textura_blanca
