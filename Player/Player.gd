extends KinematicBody2D

var speed
export var dash_speed = 1100
export var default_speed = 400
var can_dash = true

func _ready():
	speed = default_speed

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
	if Input.is_action_just_pressed('dash') and can_dash:
		speed = dash_speed
		can_dash = false
		$DashDuration.start()
	
	move_and_slide(direction.normalized() * speed)

func _on_DashDuration_timeout():
	speed = default_speed
	if $DashCoolDown.is_stopped():
		$DashCoolDown.start()


func _on_DashCoolDown_timeout():
	can_dash = true
