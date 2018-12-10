extends Timer

export var insanity_degradation_rate = 3
export var difficulty_increase_rate = 3
export var score_rate = 5

func _on_GameBeat_timeout():
	GAME_STATE.adjust_insanity(-insanity_degradation_rate)
	GAME_STATE.adjust_difficulty(difficulty_increase_rate)
	GAME_STATE.adjust_score(score_rate)
	start()
