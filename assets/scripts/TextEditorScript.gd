extends TextEdit

var text_focused = false

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	TextEditorScript.text_focused


func _on_focus_entered():
	set_editable(true)
	#print("focus in")
	TextEditorScript.text_focused = true
	#print(text_focused)

func _on_input_defender_arena_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			set_editable(false)
			TextEditorScript.text_focused = false
			#print(text_focused)
