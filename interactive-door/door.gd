extends Node2D

var player_have_key = false

var door_locked = true

var door_open = false

var player_nearby = false

signal door_unlocked

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
		$DoorSprite.show()
		$DoorLockedSprite.hide()
		door_unlocked.emit()
	else:
		print("Дверь заперта. Нужен ключ!")
		return

func open_door():
	door_open = true
	print("Дверь открыта.")
	$DoorSprite.hide()
	$DoorOpenedSprite.show()
	$StaticBody2D/DoorCollision.disabled = true

func close_door():
	door_open = false
	print("Дверь закрыта.")
	$DoorSprite.show()
	$DoorOpenedSprite.hide()
	$StaticBody2D/DoorCollision.disabled = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	player_nearby = true
	print("Подошел к двери")
	print(body.name)

func _on_area_2d_body_exited(body: Node2D) -> void:
	player_nearby = false
	print("Отошел от двери")


func _on_area_2d_PLAYER_entered(body: Node2D) -> void:
	player_have_key = true
	print("Взяд ключ скрипт двери")
