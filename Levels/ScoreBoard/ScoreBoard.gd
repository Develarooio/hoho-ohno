extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _process(delta):
	text = "SCORE: {s}".format({"s": GAME_STATE.score})
