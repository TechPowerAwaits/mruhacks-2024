extends Panel

# We know that dialogue_closed is unused within script.
@warning_ignore("UNUSED_SIGNAL")
signal dialogue_closed


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


func _get_random_line(file_path: String) -> String:
	var text_file := FileAccess.open(file_path, FileAccess.READ)
	var list := list_gen(text_file)
	text_file.close()
	var num_strings := list.size()
	return list[randi() % num_strings]


func display_random_line(file_path: String) -> void:
	show()
	$DialogueText.text = _get_random_line(file_path)


func list_gen(file: FileAccess) -> Array:
	var list := Array()
	var line := file.get_line()
	while line != "":
		list.append(file.get_line())
		line = file.get_line()
	return list

		
func _on_done_button_pressed() -> void:
	emit_signal("dialogue_closed")
