extends KinematicBody2D

var DIR_CHANGE_LIKELIHOOD = 0.9
export var SPEED = 5
export var GHOST_POWER = 1
var dir =  Vector2(rand_range(-100,100), rand_range(-100,100))
var moving = true
var ray_hits = []

# lunging
var lunge_direction = null
var LUNGE_SPEED = 5
var can_lunge = true

var can_hit_player = true

func _can_see_player():
	for b in $SiteArea.get_overlapping_bodies():
		if b.get_name() == "Player":
			return has_los_with_player_body(b)

func draw_sight(cast_result):
	draw_line(Vector2(), (cast_result - global_position), Color(1,0,0))

#draw the raycasts	
#func _draw():
#	for hit in ray_hits:
#		draw_sight(hit)
	
func has_los_with_player_body(body):
	# Cast some rays to see if there are obstacles between the player
	# and the farmer
	var space_state = get_world_2d().direct_space_state
	var extents = body.get_collision_shape().extents
	ray_hits.clear()
	var body_pos = body.get_global_position()
	var nw_corner = body_pos - extents
	var sw_corner = Vector2((body_pos.x - extents.x), (body_pos.y + extents.y))
	var ne_corner = Vector2((body_pos.x + extents.x), (body_pos.y - extents.y))
	var se_corner = body_pos + extents

	for pos in [body_pos, nw_corner, sw_corner, ne_corner, se_corner]:
		var ray_res = space_state.intersect_ray(global_position, pos, [self, $GhostyArea])
		if ray_res and ray_res["collider"].get_name() == "Player":
			ray_hits.append(ray_res.position)

	update()
	if ray_hits.size() > 0:
		return true
	else:
		return false
	
func _lunge(dir):
	$LungeTimer.start()
	can_lunge = false
	lunge_direction = dir


func _process(delta):
	
	var transparency = GAME_STATE.insanity / float(GAME_STATE.MAX_INSANITY)
	$GhostySprite.set_modulate(Color(1,1,1,transparency))
	
	# Early return if lunging
	if lunge_direction:
		move_and_slide(-lunge_direction * LUNGE_SPEED)
		return
		
	if _can_see_player() and can_lunge:
		_lunge(global_position - ray_hits[0])
		
	if (rand_range(0,1) > 0.97):
		moving = !moving
	
	# Only change direction x% of the time where x is (1-DIR_CHANGE_LIKELIHOOD)*100
	if (rand_range(0.0,1.0) > DIR_CHANGE_LIKELIHOOD):
		dir.x = rand_range(-100,100)

	if (rand_range(0.0,1.0) > DIR_CHANGE_LIKELIHOOD):
		dir.y = rand_range(-100,100)
	
	if moving:
		move_and_slide(dir * SPEED)
	

func _on_LungeTimer_timeout():
	$LungeCooldown.start()
	lunge_direction = null

func _on_LungeCooldown_timeout():
	can_lunge = true


func _on_GhostyArea_body_entered(body):
	if body.get_name() == "Player" and can_hit_player:
		GAME_STATE.adjust_player_health(-GHOST_POWER)
		$PlayerHitCooldown.start()
		can_hit_player = false


func _on_PlayerHitCooldown_timeout():
	print("cooled down")
	can_hit_player = true