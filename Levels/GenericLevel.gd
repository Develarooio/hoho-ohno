extends Node2D


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if game_over():
		game_over_message()

func game_over():
	if GAME_STATE.player_health <= 0:
		$GameOverCamera.position = $Player.get_camera_position()
		$GameOverCamera.current = true
		$Player.deactivate()
		return true
	else:
		return false

func game_over_message():
	$GameOver.text = "Game over!  Your score was: " + str(GAME_STATE.score) + ".  Press R to retry"
	$GameOver.rect_position = $GameOverCamera.position - Vector2(250, 0)
	$GameOver.show()