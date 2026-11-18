extends CanvasLayer

@onready var texture = $TextureRect

func show_damage():
	texture.modulate.a = 0.7
	
	var tween = create_tween()
	tween.tween_property(texture, "modulate:a", 0.0, 0.5)
