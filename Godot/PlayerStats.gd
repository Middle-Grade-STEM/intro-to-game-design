extends "res://Stats.gd"

signal max_score_achieved

var score = 0 setget set_score

var max_score = 0 setget set_max_score

func set_max_score(num):
	pass
	max_score = num

func set_score(num):
	score = num
	if score == max_score:
		emit_signal("max_score_achieved")
