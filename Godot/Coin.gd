extends Area2D




func _on_Coin_body_entered(body):
	SoundManager.play_fixed_sound(1)
	PlayerStats.score += 1
	queue_free()
