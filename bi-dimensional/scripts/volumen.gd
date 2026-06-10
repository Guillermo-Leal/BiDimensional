extends HSlider

@export
var Master: String
var bus_index: int 

func _ready() -> void:
	#Usa un index para recoger el bus master
	bus_index = AudioServer.get_bus_index(Master)
	value_changed.connect(_on_value_changed)

#cuando se cambia el valor al usar la barra se manda directamente al bus value y se modifica
func _on_value_changed(value: float) -> void: 
	AudioServer.set_bus_volume_db(
		bus_index,
		linear_to_db(value)
	)
