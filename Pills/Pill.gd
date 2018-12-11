extends Area2D

export var pill_strength = 25
export var spawn_range_start = 5
export var spawn_range_end = 10

func _ready():
	$RespawnTimer.wait_time = rand_range(spawn_range_start, spawn_range_end)

func _on_Pill_body_entered(body):
	if body.is_in_group('players'):
		GAME_STATE.adjust_insanity(pill_strength)
		visible = false
		call_deferred("set_monitoring", false)
		$RespawnTimer.start()


func _on_RespawnTimer_timeout():
	visible = true
	call_deferred("set_monitoring", true)
	$RespawnTimer.wait_time = rand_range(spawn_range_start, spawn_range_end)
