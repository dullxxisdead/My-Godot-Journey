extends ProgressBar

@export var health = 100

@export var max_health = 100

var is_poisoned = false

var number

var health_tween: Tween

var hp_gradient = Gradient.new()


func pick_event():
	number = randi_range(1, 10)
	if number in range(1, 5):
		take_damage(10, "Случайное событие")
	elif number in range(5, 8):
		heal(20)
	elif number in range(8, 10):
		_on_button_poison_pressed()
	else:
		pass
	return

func update_healthbar():
	var _health_ratio = float(health) / max_health
	var hp_color = hp_gradient.sample(ratio)
	var fill_style = get_theme_stylebox("fill")
	fill_style.bg_color = hp_color
	value = health
	max_value = max_health
	if health < 1:
		get_tree().change_scene_to_file("res://death_screen.tscn")

func show_damage(enemy_name, damage):
	print(enemy_name, " нанес " , damage, " урона.")

func heal(healing):
	is_poisoned = false
	if health <= 0:
		return
	if health <= max_health - 1:
		health = health + healing
	if health >= max_health:
		health = max_health
	print("Вы были вылечены до ", health, "hp")
	update_healthbar()

func take_damage(damage, enemy_name):
	if health < 1:
		return
	else:
		health = health - damage
		$TimerHeal.wait_time = 3
		$TimerHeal.start()
	if health < 0:
		health = 0
	show_damage(enemy_name, damage)
	update_healthbar()

func _ready() -> void:
	hp_gradient.set_color(0, Color.CRIMSON)
	hp_gradient.set_color(1, Color.SEA_GREEN)
	hp_gradient.add_point(0.5, Color.GOLDENROD)
	update_healthbar()

func _on_button_damage_pressed() -> void:
	take_damage(25, "Ты")


func _on_button_heal_pressed() -> void:
	heal(20)


func _on_timer_timeout() -> void:
	$TimerHeal.wait_time = 1
	$TimerHeal.start()
	heal(5)
	if health > max_health - 1:
		$TimerHeal.wait_time = 3
		$TimerHeal.stop()
	


func _on_button_poison_pressed() -> void:
	is_poisoned = true
	$poison.show()
	if not is_poisoned:
		$poison.hide()
		return
	take_damage(10, "Яд")
	if health <= 0:
		return
	await get_tree().create_timer(1.5).timeout
	for i in range(4):
		if not is_poisoned:
			$poison.hide()
			return
		take_damage(5, "Яд")
		if health <= 0:
			return
		await get_tree().create_timer(1.5).timeout
	$poison.hide()
	return


func _on_button_pressed() -> void:
	pick_event()
