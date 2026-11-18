extends Node2D

@export var health = 100

@export var max_health = 100

func show_damage(enemy_name, damage):
	print(enemy_name, "нанес" , damage, "урона.")

func check_health():
	if health <= 0:
		print("Погиб")

func heal(healing):
	if health <= 0:
		return
	if health <= max_health - 1:
		health = health + healing
	if health >= max_health:
		health = max_health
	print("Здоровье восполнено до ", health)


func take_damage(damage, enemy_name):
	if health <= 0:
		return
	health = health - damage
	show_damage(enemy_name, damage)
	check_health()

func _ready() -> void:
	take_damage(10, "Зомби")
	print(health)
	take_damage(25, "Зомби")
	print(health)
	take_damage(40, "Зомби")
	print(health)
	heal(75)
	print(health)
