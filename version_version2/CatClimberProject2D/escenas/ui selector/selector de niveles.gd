extends TextureButton

export var nivel_int = 1
export var direccion_nivel_proyecto: String = '' 

func _ready():
	if nivel_int <= Globals.nivel_actual:
		disabled = false
		$Label.visible = true
		$Label.text = str(nivel_int)
	else:
		disabled = true
		$Label.visible = false
	
func _on_TextureButton_pressed():
	if direccion_nivel_proyecto != '':
		get_tree().change_scene(direccion_nivel_proyecto)
	
