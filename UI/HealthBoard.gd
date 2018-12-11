extends Label


func _process(delta):
	text = "HEALTH: {s}".format({"s": GAME_STATE.player_health})
