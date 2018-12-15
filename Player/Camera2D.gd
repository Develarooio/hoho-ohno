extends Camera2D

var zoom_range = .6
var smooth_zoom = 1
export var shake_multiplier = 3

const ZOOM_SPEED = 10

func _process(delta):
	var insanity = (float(GAME_STATE.insanity)/100)
	smoothly_zoom(1/(insanity + zoom_range), delta)
	shake(insanity*shake_multiplier)

func shake(shake_amount):
	self.set_offset(Vector2( \
	rand_range(-1.0, 1.0) * shake_amount, \
	rand_range(-1.0, 1.0) * shake_amount \
	))

func smoothly_zoom(target_zoom, delta):
	smooth_zoom = lerp(smooth_zoom, target_zoom, ZOOM_SPEED * delta)
	if smooth_zoom != target_zoom:
		set_zoom(Vector2(smooth_zoom, smooth_zoom))