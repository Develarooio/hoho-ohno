extends KinematicBody2D

var speed = 350

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	move()

func move():
	var direction = Vector2(0,0)
	if Input.is_action_pressed('right'):
		direction.x = 1
	if Input.is_action_pressed('left'):
		direction.x = -1
	if Input.is_action_pressed('up'):
		direction.y = -1
	if Input.is_action_pressed('down'):
		direction.y = 1
	
	move_and_slide(direction.normalized() * speed)