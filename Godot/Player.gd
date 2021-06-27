extends KinematicBody2D

export (int) var ACCELERATION = 500
export (int) var MAX_SPEED = 64
export (float) var FRICTION = .25
export (int) var GRAVITY = 200
export (int) var JUMP_FORCE = 120

var motion = Vector2.ZERO
var double_jump = true

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _ready():
	PlayerStats.connect("no_health", self, "queue_free")
	PlayerStats.connect("max_score_achieved", self, "queue_free")

func _process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if x_input != 0:
		animationPlayer.play("Run")
		motion.x += x_input * ACCELERATION * delta
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED)
		sprite.flip_h = x_input < 0
	else:
		animationPlayer.play("Idle")
	
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		if x_input == 0:
			motion.x = lerp(motion.x, 0, FRICTION)
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
			SoundManager.play_fixed_sound(0)
		double_jump = true
	else:
		if double_jump == true:
			if Input.is_action_just_pressed("ui_up"):
				motion.y = -JUMP_FORCE
				SoundManager.play_fixed_sound(0)
				double_jump = false
		animationPlayer.play("Jump")
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/3:
			motion.y = -JUMP_FORCE/3
	
	motion = move_and_slide(motion, Vector2.UP)


func _on_HurtBox_area_entered(area):
	PlayerStats.health -= area.damage
	SoundManager.play_fixed_sound(2)



func _on_HitBox_area_entered(area):
	motion.y = -JUMP_FORCE
