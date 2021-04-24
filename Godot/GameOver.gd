extends Control

onready var quitButton = $QuitButton

func _ready():
	self.hide()
	PlayerStats.connect("no_health", self, "game_over")
	PlayerStats.connect("max_score_achieved", self, "game_over")

func _on_QuitButton_pressed():
	SoundManager.play_fixed_sound(3)
	get_tree().quit()

func game_over():
	pass
	self.show()
