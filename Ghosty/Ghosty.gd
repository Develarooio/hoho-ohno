extends KinematicBody2D

var DIR_CHANGE_LIKELIHOOD = 0.9
var SPEED = 5
var dir =  Vector2(rand_range(-100,100), rand_range(-100,100))
var moving = true

func _process(delta):
	if (rand_range(0,1) > 0.97):
		moving = !moving
		
	var transparency = GAME_STATE.insanity / GAME_STATE.MAX_INSANITY
	GAME_STATE.adjust_insanity(rand_range(-10,10))
	$GhostySprite.set_modulate(Color(1,1,1,transparency))
	# Only change direction x% of the time where x is (1-DIR_CHANGE_LIKELIHOOD)*100
	if (rand_range(0.0,1.0) > DIR_CHANGE_LIKELIHOOD):
		dir.x = rand_range(-100,100)

	if (rand_range(0.0,1.0) > DIR_CHANGE_LIKELIHOOD):
		dir.y = rand_range(-100,100)
	
	if moving:
		move_and_slide(dir * SPEED)
	