extends Node

func _on_Timer_timeout():
	print("s: {s}, i: {i}, d: {d}, h: {h}".format({
		"s": GAME_STATE.score,
		"i": GAME_STATE.insanity,
		"d": GAME_STATE.difficulty,
		"h": GAME_STATE.player_health
	}))
	
	$Timer.start()
