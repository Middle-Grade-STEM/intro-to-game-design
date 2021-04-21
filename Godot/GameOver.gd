extends Control

onready var quitButton = $QuitButton

func _ready():
	self.hide()
	PlayerStats.connect("no_health", self, "game_over")

func _on_QuitButton_pressed():
	get_tree().quit()

func game_over():
	pass
	self.show()
