extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var puntos =0

# Called when the node enters the scene tree for the first time.
func _ready():
	
		
			
	pass # Replace with function body.
 

func _on_fruta_body_entered(body):
	if body.get_name() =="KinematicBody2D":
		self.queue_free()
