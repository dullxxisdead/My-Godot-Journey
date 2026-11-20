extends CharacterBody2D

@export var speed = 100

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("MovePlayerUP"):
		velocity.y = -speed
	elif Input.is_action_pressed("MovePlayerDown"):
		velocity.y = speed
	else:
		velocity.y = 0
	
	if Input.is_action_pressed("MovePlayerLeft"):
		velocity.x = -speed
	elif Input.is_action_pressed("MovePlayerRight"):
		velocity.x = speed
	else:
		velocity.x = 0
	velocity = velocity.normalized() * speed
	move_and_slide()
