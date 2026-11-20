extends CharacterBody2D

@export var speed = 100

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("MovePlayerUP"):
		velocity.y = -100
	elif Input.is_action_pressed("MovePlayerDown"):
		velocity.y = 100
	else:
		velocity.y = 0
	
	if Input.is_action_pressed("MovePlayerLeft"):
		velocity.x = -100
	elif Input.is_action_pressed("MovePlayerRight"):
		velocity.x = 100
	else:
		velocity.x = 0
	velocity = velocity.normalized() * speed
	move_and_slide()
	print("velocity is ", velocity)
