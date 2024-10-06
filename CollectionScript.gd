extends Node
	
#@onready var game_manager = get_node("")
@onready var talk_button = get_node("TalkButton")
@onready var leave_button = get_node("LeaveButton")
#@onready var counter = Collection_Manager._get_collection_count()
@onready var counter = 1
@onready var format_string = "res://Dialogue%s.txt"
@onready var D1 = format_string % counter

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$DialogueText.text = FileAccess.get_file_as_string(D1)

func _on_collection(collection) -> void:
	if collection == backpack:
		$DialogueText.text = FileAccess.get_file_as_string("Backpack.txt")
	elif collection == book:
		$DialogueText.text = FileAccess.get_file_as_string("Book.txt")
	elif collection == broom:
		$DialogueText.text = FileAccess.get_file_as_string("Broom.txt")
	elif collection == calendar:
		$DialogueText.text = FileAccess.get_file_as_string("Calendar.txt")
	elif collection == canvas:
		$DialogueText.text = FileAccess.get_file_as_string("Canvas.txt")
	elif collection == coffee:
		$DialogueText.text = FileAccess.get_file_as_string("Coffee.txt")
	elif collection == deodorant:
		$DialogueText.text = FileAccess.get_file_as_string("Deodorant.txt")
	elif collection == fishbowl:
		$DialogueText.text = FileAccess.get_file_as_string("Fishbowl.txt")
	elif collection == folder:
		$DialogueText.text = FileAccess.get_file_as_string("Folder.txt")
	elif collection == laptop:
		$DialogueText.text = FileAccess.get_file_as_string("Laptop.txt")
	elif collection == money:
		$DialogueText.text = FileAccess.get_file_as_string("Money.txt")
	elif collection == paper:
		$DialogueText.text = FileAccess.get_file_as_string("Paper.txt")
	elif collection == pen:
		$DialogueText.text = FileAccess.get_file_as_string("Pen.txt")
	elif collection == trophy:
		$DialogueText.text = FileAccess.get_file_as_string("Trophy.txt")
	elif collection == watch:
		$DialogueText.text = FileAccess.get_file_as_string("Watch.txt")
	elif collection == waterbottle:
		$DialogueText.text = FileAccess.get_file_as_string("WaterBottle.txt")
	else:
		$DialogueText.text = "Please Press Leave."
	
func _on_leave_button_pressed() -> void:
	get_tree().quit()

#func _on_npc_talk(npc_dialogue):
	#dialogue_text = npc_dialogue
	pass
