extends Control

onready var playButton = $VBoxContainer/PlayButton
onready var quitButton = $VBoxContainer/QuitButton

func _ready():
	self.show()

func _on_PlayButton_pressed():
	self.hide()

func _on_QuitButton_pressed():
	get_tree().quit()
