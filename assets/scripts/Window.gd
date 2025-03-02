extends CharacterBody2D

var dragging = false
var drag_offset = Vector2()
var mouse_in = false

var block_multi_moving = false

# Ссылка на родителя, который управляет всеми окнами
@onready var window_manager = get_parent()

func _ready():
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed() and mouse_in:
			bring_to_top()  # Поднимаем окно вверх сразу, когда оно захвачено
			print(block_multi_moving)
			
			if block_multi_moving == false and mouse_in == true:
				dragging = true
				drag_offset = get_viewport().get_mouse_position() - position
			elif z_index == 0:
				dragging = true
				drag_offset = get_viewport().get_mouse_position() - position
		else:
			dragging = false

	elif event is InputEventMouseMotion:
		if dragging:
			position = get_viewport().get_mouse_position() - drag_offset
		#print(z_index)

func mouse_entered():
	mouse_in = true

func mouse_exited():
	mouse_in = false

# Функция для поднятия окна на верхний уровень
func bring_to_top():
	# Увеличиваем z_index для текущего окна и понижаем z_index для остальных окон
	for child in window_manager.get_children():
		if child is CharacterBody2D:
			# Понижаем z_index у всех окон
			child.z_index -= 1
	z_index = 0  # Устанавливаем z_index максимальным для данного окна

func _on_swipe_out_pressed():
	hide()

func window_entered(area):
	block_multi_moving = true

func window_exited(area):
	block_multi_moving = false
