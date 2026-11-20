extends Node2D

var is_door_open = false

func door_interaction():
	if Input.is_action_just_pressed("PlayerAction"):
		if is_door_open == false:
			open_door()
		else:
			return
	elif Input.is_action_just_pressed("PlayerAction"):
		if is_door_open == true:
			close_door()

func open_door():
	pass

func close_door():
	pass
