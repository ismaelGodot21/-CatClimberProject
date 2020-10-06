extends Node

var nivel_actual: int = 1 setget nivel_actual_cambiado

var datos_de_juego = {
	'nivel_actual': nivel_actual
}



func _ready():
	load_game() 

func nivel_actual_cambiado(nivel):
	nivel_actual = nivel
	
func save_game():
	var file = File.new()
	file.open('res://savedata/data.save', File.WRITE)
	file.store_line(to_json(datos_de_juego))
	file.close()
	
func load_game():
	var file = File.new()
	if file.file_exists('res://savedata/data.save'):
		file.open('res://savedata/data.save', File.READ)
	else:
		print('No parece existir el archivo del nivel')
		return

	while file.getposition() < file.getlen():
		var dataJson = parse_json(file.get_line)
		nivel_actual = dataJson['nivel_actual']
		
	file.close()
