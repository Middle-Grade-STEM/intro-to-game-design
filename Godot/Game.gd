extends Node2D

onready var coins = $Coins

func _ready():
	PlayerStats.set_max_score(coins.get_child_count())
