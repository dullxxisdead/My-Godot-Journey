extends CanvasLayer

static var image = load("res://Life.png")
var time_elapsed := 0


func _ready() -> void:
	global.score = 0
	global.meteor_destroyed = 0

	global.score_changed.connect(update_score)
	update_score()


func update_score() -> void:
	$MarginContainer/Label.text = str(global.score)


func set_health(amount):
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free()

	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		$MarginContainer2/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP


func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	global.score += 1
	global.score_changed.emit()
