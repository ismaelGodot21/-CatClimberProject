extends KinematicBody2D

var dir = -1
var speed =200
var tiempo = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _process(delta):
	var move = move_and_collide(Vector2(0,dir*speed*delta))
	if move!=null:
		yield(get_tree().create_timer(tiempo,0), "timeout")
		self.queue_free()
		pass
		# if global_position.y > 200 || global_position.y < 0:
			# self.queue_free()
 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
