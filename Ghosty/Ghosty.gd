extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var DIR_CHANGE_LIKELIHOOD = 0.9
var SPEED = 5
var dir =  Vector2(rand_range(-100,100), rand_range(-100,100))

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if (rand_range(0.0,1.0) > DIR_CHANGE_LIKELIHOOD):
		dir.x = rand_range(-100,100)

	if (rand_range(0.0,1.0) > DIR_CHANGE_LIKELIHOOD):
		dir.y = rand_range(-100,100)
	
	move_and_slide(dir * SPEED)
	