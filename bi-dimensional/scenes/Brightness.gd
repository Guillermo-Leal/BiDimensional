extends HSlider


func _on_value_changed(value: float) -> void:
	Brightness.environment.adjustment_brightness = value
