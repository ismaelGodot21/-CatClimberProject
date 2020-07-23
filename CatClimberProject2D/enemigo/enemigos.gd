extends RigidBody2D


var velocidad = 60
enum Direction {RIGHT , LEFT}

onready var RayIzquierda =get_node("RayIzquierda")
onready var RayDerecha =get_node("RayDerecha")

var Float = Direction.RIGHT

 

func _integrate_forces (state):
	
	if abs (state.get_linear_velocity().x ) <0.2:
		if Float == Direction.RIGHT: Float = Direction.LEFT
		elif Float == Direction.LEFT: Float = Direction.RIGHT
	
	if Float == Direction.RIGHT:
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("atacar")
		if RayIzquierda.is_colliding():
			set_linear_velocity (Vector2 (velocidad,0))
		else:
			Float = Direction.LEFT
	
	if Float == Direction.LEFT:
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("atacar")
		if RayDerecha.is_colliding():
			set_linear_velocity (Vector2 (-velocidad,0))
		else:
			Float = Direction.RIGHT
	pass
 


func _on_RigidBody2D_body_entered(body):
	 
	
	if body.get_name() =="KinematicBody2D":
		print ("body.contacto")
		body.quitar_vida()
		 
	pass # Replace with function body.
