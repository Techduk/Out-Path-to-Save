extends Area2D

func _process(delta):
	if Input.is_action_just_pressed("fullscreen"):
		if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#print($SaveCharacter.position.x)
	#print($SaveCharacter.position.y)


func out_of_screen(body):
	print ("out of box")
	$SaveCharacter.position.y = 200
	$SaveCharacter.position.x = 300
	$SaveCharacter.velocity.y = 0
	$SaveCharacter.velocity.x = 0
