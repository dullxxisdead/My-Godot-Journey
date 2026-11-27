extends Area2D

@export var scene_number = "res://Scene2.tscn"

func _on_body_entered(body: Node2D) -> void:
	print("Переход на ", scene_number)
	if body.name == "Player":
		get_tree().call_deferred("change_scene_to_file", (scene_number))
