extends CharacterBody2D

@export var speed = 30


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Left"):
		velocity.x =+ -speed
	elif Input.is_action_pressed("Right"):
		velocity.x =+ speed
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("Up"):
		velocity.y =+ -speed
	elif Input.is_action_pressed("Down"):
		velocity.y =+ speed
	else:
		velocity.y = 0
	
	velocity.normalized()
	move_and_slide()
