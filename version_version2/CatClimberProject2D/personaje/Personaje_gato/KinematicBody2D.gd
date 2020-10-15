extends KinematicBody2D
const gravedad = 30  # CONTROL DE GRAVEDAD
var velocidad = 300 # VELOCIDAD PERSONAJE
const velocidadT = 900
const velocidadsalto = 700
const PosicionCaida = 500
 
var arriba = Vector2(0,-1)
 
var direccion = Vector2(0,0)

var EnemigoAT  = false
var trampolin = false
onready var textoVidas = $textosPuntos
var vidas = 3
var bala =load ("res://escenas/GUI_PUNTOS/GUI_puntos100.tscn")
var balaa =load ("res://escenas/GUI_PUNTOS/GUI_puntos500.tscn")
var Arma =load ("res://scripts/Armas/ArmaHueso.tscn")
var corazones = 0
var snap = 32
var ejeY = 0
var ejeX = 0

# he creado estas variables con el objetivo de que recoja cierta informacion de los ojes 
const calculadorY = 1000 
const calculadorX = 2000


func _physics_process(_delta):
	_huesoDD()
	animar()
	mover()
	aplicar_gravedad()
	saltar()
	# agachar()
	 
# warning-ignore:return_value_discarded
	move_and_slide(direccion, arriba)
	 
func mover():
	if Input.is_action_pressed("izquierda"):
		direccion.x =   -velocidad
	elif Input.is_action_pressed("derecha"):
		direccion.x =   +velocidad
	else:
		 direccion.x = 0
	if (Input.is_action_pressed("correr")):
		velocidad = 400
	else:
		velocidad = 300
			
func aplicar_gravedad():
	if position.y > PosicionCaida:
# warning-ignore:return_value_discarded
		get_tree().reload_current_scene()
	
	if is_on_ceiling():
		direccion.y = gravedad
		
	elif is_on_floor():
		if EnemigoAT == true:
			direccion.y = -velocidad
			EnemigoAT = false
		
		elif trampolin == true:
			direccion.y = -velocidadT
			 
			trampolin = false
		else:
			direccion.y = 0
		 
	else:
		direccion.y = direccion.y + gravedad
func saltar ():
	if Input.is_action_pressed("saltar") and is_on_floor():
		direccion.y = -velocidadsalto
		 

# func agachar():
	# if Input.is_action_pressed("agachar") and is_on_floor():
		# if direccion.y == 0:
		#  $Animacion.play("agachar")
		
func animar():
	if direccion.y < 0:
		$Animacion.play("saltando")
	elif direccion.x > 0:
		$Animacion.flip_h = false
		$Animacion.play("corriendo")
	elif direccion.x < 0:
		$Animacion.flip_h = true
		$Animacion.play("corriendo")
	elif direccion.x == 0:
		$Animacion.play("parado")
		
func _process(_delta):
	 
	if (vidas <=- 0):
		print("eliminado")
	
func quitar_vida():
	EnemigoAT = true
	vidas = vidas -1
	print(vidas)
 
pass
func on_trampolin2_body_entered(body):
	 
	pass # Replace with function body.


func _on_fruta_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		_dispararr()
	 
	pass # Replace with function body.

func _on_saco_dinero_body_entered(_body):
	_dispararrr()
	pass # Replace with function body.
	
func _dispararr():
	var newBala = bala.instance()
	get_parent().add_child(newBala)
	newBala.global_position = $pos_bala.global_position
	newBala.dir = -1
	pass
	
func _dispararrr():
	var newBala = balaa.instance()
	get_parent().add_child(newBala)
	newBala.global_position = $pos_balaa.global_position
	newBala.dirr = -1
	
func _huesoDD():
	if Input.is_action_just_pressed("disparar"):
		var newBala = Arma.instance()
		get_parent().add_child(newBala)
		newBala.global_position = $Arma.global_position
		newBala.dirrr = 5
	

 


func _on_trampolin2_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		trampolin = true
		 
		$Animacion.play("corriendo")
	pass # Replace with function body.
