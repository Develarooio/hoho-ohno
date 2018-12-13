extends Camera2D

func _process(delta):
	var insanity = (float(GAME_STATE.insanity)/100 + .6)
	zoom.x = 1/insanity
	zoom.y = 1/insanity
	