extends Node
	
#@onready var game_manager = get_node("")
#@onready var dialogue_text = get_node("DialogueText")
@onready var dialogue_text = "Help me."
@onready var talk_button = get_node("TalkButton")
@onready var leave_button = get_node("LeaveButton")
var rng = RandomNumberGenerator.new()
func _ready():
	var my_random_number = rng.randf_range(0.0, 30.0)
	$DialogueText.text = FileAccess.get_file_as_string("")

func _talk_to_NPC() -> void:
	#$DialogueText.text = get_line()
	#Get a random line from the NPC Text file
	pass
		
func _on_leave_button_pressed() -> void:
	get_tree().quit()

func _on_npc_talk(npc_dialogue):
	dialogue_text = npc_dialogue
	pass
