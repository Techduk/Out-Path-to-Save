extends Node2D

@onready var totally_time = Time.get_time_dict_from_system()

func _ready():
	pass

func _process(delta):
	totally_time = Time.get_time_dict_from_system()
	var hour = str(totally_time.hour).pad_zeros(2)
	var min = str(totally_time.minute).pad_zeros(2)
	var sec = str(totally_time.second).pad_zeros(2)
	$Label.text = str(hour, ":", min, ":", sec)
#	await get_tree().create_timer(1).timeout
#	print(totally_time.hour, ":", totally_time.minute, ":", totally_time.second)
