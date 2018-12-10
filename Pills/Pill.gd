extends Area2D

export var pill_strength = 25

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Pill_body_entered(body):
	if body.is_in_group('players'):
		GAME_STATE.adjust_insanity(pill_strength)
		queue_free()
