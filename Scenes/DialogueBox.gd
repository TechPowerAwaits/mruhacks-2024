extends Node

const DIALOGUE_LINES := 5
const DIALOGUE_FILE := "res://Dialogue.txt"

var text_file: FileAccess = null
var counter := 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_file = FileAccess.open(DIALOGUE_FILE, FileAccess.READ)
	counter = 1
	$DialogueText.text = text_file.get_line()
	

func _on_talk_button_pressed() -> void:
	if counter < DIALOGUE_LINES:
		counter += 1
		$DialogueText.text = text_file.get_line()
	else:
		$DialogueText.text = "Please Press Leave."
	
func _on_leave_button_pressed() -> void:
	if text_file != null:
		text_file.close()
		text_file = null
	get_tree().quit()
