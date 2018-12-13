extends Camera2D

var smooth_zoom = 1
var target_zoom = 1

const ZOOM_SPEED = 10

func _process(delta):
	var insanity = (float(GAME_STATE.insanity)/100 + .6)
	target_zoom = 1/insanity
	
	smooth_zoom = lerp(smooth_zoom, target_zoom, ZOOM_SPEED * delta)
	if smooth_zoom != target_zoom:
		set_zoom(Vector2(smooth_zoom, smooth_zoom))
	