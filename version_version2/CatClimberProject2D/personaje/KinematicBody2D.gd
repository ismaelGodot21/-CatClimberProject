extends KinematicBody2D
const gravedad = 50  # CONTROL DE GRAVEDAD
const velocidad = 300 # VELOCIDAD PERSONAJE
const velocidadT = 1100
const velocidadsalto = 900
const PosicionCaida = 500
 
var arriba = Vector2(0,-1)
 
var direccion = Vector2(0,0)

var EnemigoAT  = false
var trampolin = false
onready var textoVidas = $textoPuntos
var vidas = 3
var bala =load ("res://Bala/Bala.tscn")
var balaa =load ("res://bala500/punto500.tscn")
var Arma =load ("res://ArmaHueso/ArmaHueso.tscn")
var corazones = 0

var ejeY = 0
var ejeX = 0

# he creado estas variables con el objetivo de que recoja cierta informacion de los ojes 
const calculadorY = 1000 
const calculadorX = 2000

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
 
# Called when the node enters the scene tree for the first time.
func _physics_process(_delta):
	_huesoDD()
	animar()
	mover()
	aplicar_gravedad()
	saltar()
	# agachar()
	 
# warning-ignore:return_value_discarded
	move_and_slide(direccion,arriba)
	 
func mover():
	if Input.is_action_pressed("izquierda"):
		direccion.x =   -velocidad
	elif Input.is_action_pressed("derecha"):
		direccion.x =   +velocidad
	else:
		 direccion.x = 0
	
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
func _on_trampolin_body_entered(body):
	 
	if body.get_name() =="KinematicBody2D":
		trampolin = true
		 
		$Animacion.play("corriendo")
	pass # Replace with function body.


func _on_fruta_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		_dispararr()
	 
	pass # Replace with function body.

func _on_saco_dinero_body_entered(body):
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
	
