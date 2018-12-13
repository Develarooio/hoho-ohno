extends Node2D

var  bullet = preload("res://Player/Gun/Bullet.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	var collider = get_laser_collision()
	if collider != null and collider.is_in_group('ghosties'):
		collider.queue_free()

#Shoot Bullets
#func shoot(angle):
#	var new_bullet = bullet.instance()
#	get_tree().get_root().add_child(new_bullet)
#	new_bullet.set_direction(angle)
#	new_bullet.position = get_parent().position

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