extends Node

onready var music = $Music
onready var sounds = $Sounds

var possible_music = [
	#preload(""),
]

var possible_sounds = [
	preload("res://Assets/jump.wav"),
	preload("res://Assets/coin.wav"),
	preload("res://Assets/enemy_hit.wav"),
	preload("res://Assets/select.wav"),
]

func ready():
	randomize()

func play_random_music():
	var temp = floor(rand_range(0, possible_music.size()))
	music.stream = possible_music[temp]
	music.play()

func play_random_sound():
	var temp = floor(rand_range(0, possible_sounds.size()))
	sounds.stream = possible_sounds[temp]
	sounds.play()

func play_fixed_sound(sound):
	sounds.stream = possible_sounds[sound]
	sounds.play()
	
func play_fixed_music(music):
	music.stream = possible_music[music]
	music.play()
