extends Panel

const DIALOGUE_LINES := 5
const DIALOGUE_FILE := "res://Dialogue.txt"

var text_file: FileAccess = null
var counter := 1
var num_lines := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Can get away with assuming that reading never fails, since it is stored within the project.
func load_text(path: String, number_lines: int) -> void:
	text_file = FileAccess.open(path, FileAccess.READ)
	show()
	$DialogueText.txt = text_file.get_line()
	counter = 1
	num_lines = number_lines


func _close_text() -> void:
	hide()
	counter = 1
	num_lines = 0
	if text_file != null:
		text_file.close()
		text_file = null


func _on_talk_button_pressed() -> void:
	if counter < num_lines:
		counter += 1
		$DialogueText.text = text_file.get_line()
	else:
		_close_text()


func _on_leave_button_pressed() -> void:
	_close_text()
