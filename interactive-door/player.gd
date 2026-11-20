extends CharacterBody2D

func _physics_process(float) -> void:
	if Input.is_action_pressed("MovePlayerUP"):
		velocity.y =+ -100
	elif Input.is_action_pressed("MovePlayerRight"):
		velocity.x =+ 100
	elif Input.is_action_pressed("MovePlayerDown"):
		velocity.y =+ 100
	elif Input.is_action_pressed("MovePlayerLeft"):
		velocity.x =+ -100
	else:
		if not Input.is_anything_pressed():
			velocity.x = 0
			velocity.y = 0
	move_and_slide()
