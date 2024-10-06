extends Node
	
#@onready var game_manager = get_node("")
#@onready var dialogue_text = get_node("DialogueText")
@onready var dialogue_text = "Help me."
@onready var talk_button = get_node("TalkButton")
@onready var leave_button = get_node("LeaveButton")

func _ready():
	const FILENAME := "res://Dialogue.txt"
	var text_file: FileAccess = null
	var counter := 1
	var appendix = []
	var quote_file = FileAccess.open(FILENAME, FileAccess.READ)
	
func make_list(quote_file, appendix):
	for num in range(30):
		var new_line = quote_file.get_line()
		appendix.append(new_line)
	return appendix

func pick_rand_num():
	var rng = RandomNumberGenerator.new()
	var my_random_number = rng.randf_range(0.0, 30.0)

func _talk_to_NPC(my_random_number,appendix):
	var NPC_line = (appendix[my_random_number])
	return NPC_line
		
func _on_leave_button_pressed() -> void:
	get_tree().quit()

func _on_npc_talk(npc_dialogue):
	dialogue_text = npc_dialogue
