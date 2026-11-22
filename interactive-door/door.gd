extends Node2D

var player_have_key = false

var door_locked = false

var door_open = false

var player_nearby = false

func _process(delta: float) -> void:
	door_interaction()

func door_interaction():
	if Input.is_action_just_pressed("PlayerAction") and player_nearby == true:
		if door_locked == true:
			unlock_door()
		else:
			if door_open == false:
				open_door()
			else:
				close_door()

func unlock_door():
	if player_have_key == true:
		door_locked = false
		print("Дверь отперта!")
	else:
		print("Дверь заперта. Нужен ключ!")
		return

func open_door():
	door_open = true
	print("Дверь открыта.")

func close_door():
	door_open = false
	print("Дверь закрыта.")

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_nearby = true
	print("Подошел к двери")
	print(body.name)

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_nearby = false
	print("Отошел от двери")
