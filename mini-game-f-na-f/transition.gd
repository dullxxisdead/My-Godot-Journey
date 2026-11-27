extends Area2D

@export var scene_number = "res://Scene2.tscn"

func _on_body_entered(body: Node2D) -> void:
	print("Переход")
	if body.name == "Player":
		get_tree().change_scene_to_file(scene_number)
