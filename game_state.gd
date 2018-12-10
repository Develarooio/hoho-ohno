extends Node

var score
var insanity
var difficulty
var player_health


func _ready():
	score = 0
	insanity = 0
	difficulty = 0
	player_health = 3

func adjust_score(delta):
	score += delta

func adjust_insanity(delta):
	insanity += delta

func adjust_difficulty(delta):
	difficulty += delta

func adjust_player_health(delta):
	player_health += delta
