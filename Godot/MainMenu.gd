extends Control

onready var playButton = $VBoxContainer/PlayButton
onready var quitButton = $VBoxContainer/QuitButton

func _ready():
	self.show()
	get_tree().paused = true

func _on_PlayButton_pressed():
	self.hide()
	get_tree().paused = false

func _on_QuitButton_pressed():
	get_tree().quit()
