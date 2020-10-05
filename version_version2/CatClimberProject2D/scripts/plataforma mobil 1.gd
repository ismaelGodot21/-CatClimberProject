extends Node2D
export var idle_duration: float = 1.0
export var move_to: Vector2
export var cell_size: Vector2
export var speed: float = 3.0
var follow: Vector2 = Vector2.ZERO
onready var platform = $platform
onready var tween = $move_tween

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_init_tween()
	
func _init_tween() -> void:
	move_to = move_to * cell_size
	var duration = move_to.length() / speed
	
	tween.interpolate_property(self, "follow", Vector2.ZERO, 
			move_to, duration, Tween.TRANS_LINEAR,
			Tween.EASE_IN_OUT, idle_duration)
	
	tween.interpolate_property(self, "follow", move_to, Vector2.ZERO, 
			duration, Tween.TRANS_LINEAR, 
			Tween.EASE_IN_OUT, duration + idle_duration * 2)
	
	tween.start()
	
func _physics_process(delta):
	platform.position = platform.position.linear_interpolate(follow, 0.075)
