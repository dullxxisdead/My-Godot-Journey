extends ProgressBar

@export var health = 100

@export var max_health = 100

func update_healthbar():
	value = health
	max_value = max_health

func show_damage(enemy_name, damage):
	print(enemy_name, "нанес" , damage, "урона.")

func heal(healing):
	if health <= 0:
		return
	if health <= max_health - 1:
		health = health + healing
	if health >= max_health:
		health = max_health
	update_healthbar()

func take_damage(damage, enemy_name):
	if health <= 0:
		return
	health = health - damage
	if health <= 0:
		health = 0
	show_damage(enemy_name, damage)
	update_healthbar()

func _ready() -> void:
	update_healthbar()

func _on_button_damage_pressed() -> void:
	take_damage(10, "Ты")


func _on_button_heal_pressed() -> void:
	heal(10)


func _on_button_revive_pressed() -> void:
	if health <= 0:
		health = 20
	else:
		return
	update_healthbar()
