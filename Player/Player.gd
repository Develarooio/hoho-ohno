extends KinematicBody2D

var speed
export var dash_speed = 1100
export var default_speed = 400
var can_dash = true
var can_shoot = true
var aiming

func _ready():
	speed = default_speed

func _process(delta):
	move()
	aim()
	shoot()

func shoot():
	if Input.is_action_just_pressed('shoot') and can_shoot:
		can_shoot = false
		$Gun.shoot(aiming)
		$ShootCoolDown.start()

func aim():
	var mouse_pos = get_global_mouse_position()
	var aiming_vector = (mouse_pos - global_position)
	if aiming_vector.length() > 10:
		aiming = aiming_vector.angle() * 180/PI
		$Gun.rotation_degrees = aiming 

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

func get_collision_shape():
	return shape_owner_get_shape(0,0)

func _on_DashDuration_timeout():
	speed = default_speed
	if $DashCoolDown.is_stopped():
		$DashCoolDown.start()


func _on_DashCoolDown_timeout():
	can_dash = true


func _on_ShootCoolDown_timeout():
	can_shoot = true
