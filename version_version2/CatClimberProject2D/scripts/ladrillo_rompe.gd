extends RigidBody2D

var tiempo = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ladrillo_rompe_body_entered(body):
	 
	if body.get_name() =="KinematicBody2D":
		print("destruye")
		yield(get_tree().create_timer(1.0), "timeout")
		self.queue_free()


func _on_Area2D_area_entered(area):
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	pass # Replace with function body.
