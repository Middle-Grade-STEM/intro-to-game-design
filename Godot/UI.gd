extends CanvasLayer

onready var scoreLabel = $Control/Score

func _process(delta):
	scoreLabel.text = str(PlayerStats.score)
