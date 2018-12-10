extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var  bullet = preload("res://Player/Gun/Bullet.tscn")

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func shoot(angle):
	var new_bullet = bullet.instance()
	get_tree().get_root().add_child(new_bullet)
	new_bullet.set_direction(angle)
	new_bullet.position = get_parent().position