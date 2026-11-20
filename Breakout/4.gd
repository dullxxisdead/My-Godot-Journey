extends Node2D

@export var health = 100

@export var healing = 30

@export var max_health = 100

func heal():
	if health <= 0:
		print("Погиб")
		return
	if health <= max_health - 1:
		health = health + healing
	if health >= max_health:
		health = max_health
	print("Здоровье восполнено до ", health)


func take_damage():
	if health <= 0:
		return
	else:
		health = health - 30

func _ready() -> void:
	take_damage()
	print(health)
	heal()
	print(health)
	take_damage()
	print(health)
	take_damage()
	print(health)
	heal()
	
	print(health)
	take_damage()
	print(health)
	take_damage()
	print(health)
	take_damage()
	print(health)
	heal()
	print(health)
	
