extends CharacterBody2D

@export var speed = 400


func _physics_process(delta: float) -> void:
	var direction = Vector2(0, 0)
	#LEFT
	if Input.is_key_pressed(KEY_A):
		direction.x -= 1
	#RIGHT
	if Input.is_key_pressed(KEY_D):
		direction.x += 1
	velocity = direction * speed
	#move_and_slide()
	print(global_position.y)

#github test
