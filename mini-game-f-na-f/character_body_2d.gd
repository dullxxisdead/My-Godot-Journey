extends CharacterBody2D

@export var speed = 30


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("Left"):
		velocity.x =+ -speed
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")
		
	elif Input.is_action_pressed("Right"):
		velocity.x =+ speed
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("walk")
	else:
		velocity.x = 0
	
	if Input.is_action_pressed("Up"):
		velocity.y =+ -speed
		$AnimatedSprite2D.play("walk")
	elif Input.is_action_pressed("Down"):
		velocity.y =+ speed
		$AnimatedSprite2D.play("walk")
	else:
		velocity.y = 0
	
	if not Input.is_anything_pressed():
		$AnimatedSprite2D.play("idle")
	
	velocity = velocity.normalized() * speed
	move_and_slide()
