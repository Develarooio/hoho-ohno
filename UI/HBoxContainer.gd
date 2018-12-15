extends HBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
	if GAME_STATE.player_health == 2:
		$Sprite3.hide()
	elif GAME_STATE.player_health == 1:
		$Sprite2.hide()
	elif GAME_STATE.player_health == 0:
		$Sprite.hide()