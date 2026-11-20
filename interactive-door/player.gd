extends CharacterBody2D

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("MovePlayerUP"):
		velocity.y = -100
	else:
		velocity.y = 0
	if Input.is_action_pressed("MovePlayerRight"):
		velocity.x = 100
	else:
		velocity.x = 0
	if Input.is_action_pressed("MovePlayerDown"):
		velocity.y = 100
	else:
		velocity.y = 0
	if Input.is_action_pressed("MovePlayerLeft"):
		velocity.x = -100
	else:
		velocity.x = 0
	move_and_slide()
