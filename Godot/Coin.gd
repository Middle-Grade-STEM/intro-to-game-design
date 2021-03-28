extends Area2D




func _on_Coin_body_entered(body):
	PlayerStats.score += 1
	queue_free()
