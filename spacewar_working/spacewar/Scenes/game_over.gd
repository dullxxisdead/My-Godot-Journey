extends Control

var level_scene: PackedScene = load("res://Scenes/lvl.tscn")

func _ready() -> void:
	$CenterContainer/VBoxContainer/Label2.text += str(global.score)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Restart"):
		get_tree().change_scene_to_packed(level_scene)
