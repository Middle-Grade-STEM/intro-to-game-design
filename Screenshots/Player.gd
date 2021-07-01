extends KinematicBody2D

#variables related to player movement
export (int) var ACCELERATION = 500
export (int) var MAX_SPEED = 64
export (float) var FRICTION = 0.25
export (int) var GRAVITY = 200
export (int) var JUMP_FORCE = 120

var motion = Vector2.ZERO #the vector that allows for movement

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var x_input = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#creates a number which is indicative of the direction the player will go
	
	if x_input != 0: #if the player is holding down on the right or left key
		motion.x += x_input * ACCELERATION * delta #the player will move in a direction based on frames of the computer
		motion.x = clamp(motion.x, -MAX_SPEED, MAX_SPEED) #ensures that the movement will not be faster than the max speed
		sprite.flip_h = x_input < 0 #will output true or false, which will flip the sprite
		animationPlayer.play("Run")
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
		animationPlayer.play("Idle")
	
	motion.y += GRAVITY * delta
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
	else:
		animationPlayer.play("Jump")
		if Input.is_action_just_released("ui_up") and motion.y < -JUMP_FORCE/3:
			motion.y = -JUMP_FORCE/3
	
	motion = move_and_slide(motion, Vector2.UP)
