extends KinematicBody2D

var dirrr = -1
var speeddd =4
var tiempo = 1

 

 

# Declare member variables here. Examples:
 
# Called when the node enters the scene tree for the first time.
func _process(delta):
	$estrella.play("disparar")
	 
	var move = move_and_collide(Vector2(dirrr,0 *speeddd*delta))
	if move!=null:
		yield(get_tree().create_timer(tiempo,0), "timeout")
		self.queue_free()
		pass
		
		
		# if global_position.y > 200 || global_position.y < 0:
			# self.queue_free()
 


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
