extends Node2D

func _process(delta):
	if game_over():
		game_over_message()
		if Input.is_action_pressed('retry'):
			#Just go to main menu
			pass

func game_over():
	if GAME_STATE.player_health <= 0:
		$GameOverCamera.position = $Player.get_camera_position()
		$GameOverCamera.current = true
		$Player.deactivate()
		$GameBeat.stop()
		return true
	else:
		return false

func game_over_message():
	$GameOver.text = "Game over!  Your score was: " + str(GAME_STATE.score) + ".  Press R to retry"
	$GameOver.rect_position = $GameOverCamera.position - Vector2(250, 0)
	$GameOver.show()