extends Node

func _ready():
	DiscordRPC.app_id = 1297940397573668927 # Application ID
	DiscordRPC.details = "Totally in WIP"
	DiscordRPC.state = "Made by JCFunduk"
	DiscordRPC.large_image = "example_game" # Image key from "Art Assets"
	DiscordRPC.large_image_text = "hi!!1!"
	DiscordRPC.small_image = "" # Image key from "Art Assets"
	DiscordRPC.small_image_text = "Totally in WIP"

	#DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system()) # "02:46 elapsed"
# DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600 # +1 hour in unix time / "01:00:00 remaining"

	DiscordRPC.refresh() # Always refresh after changing the values!

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
