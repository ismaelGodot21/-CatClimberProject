extends Node2D

var frutas  = 0
var vidas = 3
onready var textoFrutas = $textoFrutas
onready var textoVidas = $textoPuntos
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_fruta_body_entered(_body):
	frutas += 1
	textoFrutas.text = "" + str(frutas)

pass 

func _process(_delta):
	Vidas()
	salir()
	pass
	

func salir():
	if Input.is_action_pressed("salir"):
		get_tree().quit()
	
func Vidas():
	
	if (vidas <= 0):
		 
		get_tree().reload_current_scene()
		print ("eliminado")
		 
		#frutas = 0
		#textoVidas.text = "" + str (vidas)
	


func _on_RigidBody2D_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		vidas = vidas -1
		textoVidas.text = ""+ str(vidas) 
	#pass # Replace with function body.
