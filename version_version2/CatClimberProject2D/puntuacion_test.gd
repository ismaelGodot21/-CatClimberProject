extends KinematicBody2D

var dir = 0
var speed =0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	var move = move_and_collide(Vector2(0,dir*speed*delta))
	if move!=null:
		pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
