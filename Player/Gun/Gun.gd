extends Node2D

var  bullet = preload("res://Player/Gun/Bullet.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var collider = get_laser_collision()
	if collider != null:
		scale_laser($RayCast2D.get_collision_point())
		if collider.is_in_group('ghosties'):
			GAME_STATE.adjust_score(10)
			collider.queue_free()

#Shoot Bullets
#func shoot(angle):
#	var new_bullet = bullet.instance()
#	get_tree().get_root().add_child(new_bullet)
#	new_bullet.set_direction(angle)
#	new_bullet.position = get_parent().position

func scale_laser(pos):
	var distance = Vector2(global_position.x - pos.x, global_position.y - pos.y)
	$Laser.scale.y = distance.length()/$Laser.texture.get_height()

func get_laser_collision():
	var collider = null 
	if $RayCast2D.is_colliding():
    	collider = $RayCast2D.get_collider()
	return collider

func enable_laser():
	$Laser.visible = true
	$RayCast2D.enabled = true

func disable_laser():
	$Laser.visible = false
	$RayCast2D.enabled = false