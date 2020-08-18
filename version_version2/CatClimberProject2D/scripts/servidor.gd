extends Node2D

var puntos  = 0
var vidas = 3 
onready var textoFrutas =$CanvasLayer/textoPuntos
onready var textoVidas = $CanvasLayer/textoFrutas
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _on_fruta_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		puntos += 100
		textoFrutas.text = "score :" + str(puntos)
 


func _process(_delta):
	Vidas()
	salir()
	pass
	
 
func salir():
	if Input.is_action_pressed("salir"):
		get_tree().quit()
	
func Vidas():
	
	if (vidas <= 0):
		 
		#get_tree().change_scene("res://nivelesmenu/menú inicio.tscn")
		print ("eliminado")
		 
		#frutas = 0
		#textoVidas.text = "" + str (vidas)
	


func _on_RigidBody2D_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		vidas = vidas -1
		textoVidas.text = ""+ str(vidas) 
	#pass # Replace with function body.


func _on_saco_dinero_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		puntos += 500
		textoFrutas.text = "score :" + str(puntos)
		pass # Replace with function body.
