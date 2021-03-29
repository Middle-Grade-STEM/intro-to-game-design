extends Control

onready var stats = $Stats

var hearts = 2 setget set_hearts
var max_hearts = 2 setget set_max_hearts

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	self.value = hearts

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	self.max_value = max_hearts

func _ready():
	self.max_hearts = stats.max_health
	self.hearts = stats.health
	var health_change = stats.connect("health_changed", self, "set_hearts")
	var max_health_change = stats.connect("max_health_changed", self, "set_max_hearts")
	if health_change != OK or max_health_change != OK:
		print("Health change did a lil oopsie")
