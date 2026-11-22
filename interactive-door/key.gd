extends Node2D



func _on_area_2d_PLAYER_entered(body: Node2D) -> void:
	print("Вы взяли ключ!")
	queue_free()
