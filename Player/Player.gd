extends KinematicBody2D

var speed
export var dash_speed = 1100
export var default_speed = 400
var can_dash = true
var can_shoot = true
var aiming
var laser_charge = 0
export var laser_charge_increment = 3

var can_charge = true

var shooting = false

func _ready():
	speed = default_speed

func _process(delta):
	$Label.text = "Charge:" + str(laser_charge)
	move()
	aim()
	shoot()

func shoot():
	if Input.is_action_pressed('shoot') and laser_charge > 0:
		can_charge = false
		shooting = true
		$Gun.enable_laser()

	if Input.is_action_just_released('shoot'):
		$ShootCoolDown.start()
		shooting = false
		$Gun.disable_laser()
	
	if laser_charge == 0:
		$Gun.disable_laser()

	if shooting:
		if laser_charge >= 0:
			if laser_charge - laser_charge_increment < 0:
				laser_charge = 0
			else:
				laser_charge -= laser_charge_increment
	elif can_charge:
		if laser_charge < 100:
			if laser_charge + laser_charge_increment > 100:
				laser_charge = 100
			else:
				laser_charge += laser_charge_increment

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
	can_charge = true
