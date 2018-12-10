extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export var speed = 25
var direction

func _process(delta):
	position += direction * speed


func _on_Area2D_body_entered(body):
	if body.is_in_group("ghosties"):
		#Hit dat ghost
		pass
	elif body.is_in_group("players"):
		pass
	else:
		queue_free()

func set_direction(angle):
	var rads_angle = angle * PI/180
	direction = Vector2()
	direction.x = cos(rads_angle)
	direction.y = sin(rads_angle)