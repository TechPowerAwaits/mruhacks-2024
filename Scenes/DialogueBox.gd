extends Node
	
#@onready var game_manager = get_node("")
#@onready var dialogue_text = get_node("DialogueText")
@onready var dialogue_text = "Help me."
@onready var talk_input = get_node("PlayerTalkInput")
@onready var talk_button = get_node("TalkButton")
@onready var leave_button = get_node("LeaveButton")
@onready var counter = 1
@onready var format_string = "res://Dialogue%s.txt"
@onready var D1 = format_string % counter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DialogueText.text = FileAccess.get_file_as_string(D1)

func _on_talk_button_pressed() -> void:
	if counter < 6:
		counter += 1
		D1 = format_string % counter
		$DialogueText.text = FileAccess.get_file_as_string(D1)
	else:
		$DialogueText.text = "Please Press Leave."
	
func _on_leave_button_pressed() -> void:
	get_tree().quit()

func _on_npc_talk(npc_dialogue):
	talk_button.disabled = talk_input
	pass
