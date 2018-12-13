extends Node2D

var ghosty = preload("res://Ghosty/Ghosty.tscn")
export var spawn_low = 15
export var spawn_high = 20

func _ready():
	randomize()
	$SpawnTimer.wait_time = get_spawn_time()

func _process(delta):
	print($SpawnTimer.wait_time)
	if $SpawnTimer.is_stopped():
		$SpawnTimer.start()



func _on_SpawnTimer_timeout():
	var new_ghosty = ghosty.instance()
	get_tree().get_root().add_child(new_ghosty)
	new_ghosty.position = position
	$SpawnTimer.wait_time = get_spawn_time()

func get_spawn_time():
	var spawn_rate = rand_range(spawn_low, spawn_high)
	var insanity = float(GAME_STATE.insanity)/10
	if insanity != 0:
		spawn_rate = spawn_rate - insanity
	return spawn_rate