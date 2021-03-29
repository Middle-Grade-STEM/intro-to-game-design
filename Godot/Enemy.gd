extends KinematicBody2D

export var ACCELERATION = 50
export var FRICTION = .25
export var GRAVITY = 2000

onready var stats = $EnemyHealthUI/Stats
onready var enemyHealthUI = $EnemyHealthUI
onready var sprite = $AnimatedSprite
onready var floorHit = $FloorHit
onready var wallHit = $WallHit
onready var hitBox = $HitBox

var motion = Vector2.ZERO
var direction = -1

func _physics_process(delta):
	motion.y += GRAVITY * delta
	motion.x = ACCELERATION * direction 
	if direction == -1:
		sprite.flip_h = false
	else:
		sprite.flip_h = true
	motion = move_and_slide(motion, Vector2.UP)
	if wallHit.is_colliding() or floorHit.is_colliding() == false:
		direction = direction * -1
		floorHit.position.x *= -1
		wallHit.cast_to.x *= -1
		hitBox.position.x *= -1


func _on_HurtBox_area_entered(area):
	stats.health -= area.damage


func _on_Stats_no_health():
	queue_free()
