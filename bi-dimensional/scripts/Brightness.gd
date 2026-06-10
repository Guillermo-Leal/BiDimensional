extends HSlider

#Cambia el valor de brillo de un modificador global
func _on_value_changed(value: float) -> void:
	Brightness.environment.adjustment_brightness = value
