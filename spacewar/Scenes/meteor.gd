extends Area2D

var speed: int
var rotation_speed: int
var direction_x: float

signal collision

var meteor_textures = [
	preload("res://Meteor.png"),
	preload("res://Meteor2.png"),
	preload("res://Meteor3.png"),
	preload("res://Meteor4.png"),
]


func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var widht = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, widht)
	var random_y = rng.randi_range(-150, 50)

	position = Vector2(random_x, random_y)
	speed = rng.randi_range(200, 500)
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)

	$Meteor.texture = meteor_textures.pick_random()


func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta


func _on_body_entered(body) -> void:
	collision.emit()
	queue_free()


func _on_area_entered(area) -> void:
	global.meteor_destroyed += 1
	global.score += 1
	global.score_changed.emit()

	area.queue_free()
	queue_free()
