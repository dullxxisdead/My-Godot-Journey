extends CharacterBody2D

@export var speed := 500
var can_shoot: bool = true

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(100, 500)
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_pos = get_global_mouse_position()
	global_position = Vector2(
		clamp(mouse_pos.x, 44, 1236),
		clamp(mouse_pos.y, 52, 671))

	if Input.is_action_just_pressed("Shoot") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserTimer.start()


func _on_laser_timer_timeout() -> void:
	can_shoot = true
