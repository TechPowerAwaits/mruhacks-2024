extends Control

const INTRO_LINES := 4
const INTRO_FILE := "res://IntroDialogue3.txt"

const OUTRO_LINES := 1
const OUTRO_FILE := "res://OutroDialogue3.txt"

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO

var items_collected := false


func _ready() -> void:
	_on_dialogue_box_dialogue_closed()
	$Level3.hide()
	$Level3/Player.set_bounds(min_pos, max_pos)
	$Level3/Player.disable()
	$DialogueBox.load_text(INTRO_FILE, INTRO_LINES)


func _on_collectible_manager_all_collected() -> void:
	$Level3.hide()
	$Level3/Player.disable()
	$DialogueBox.load_text(OUTRO_FILE, OUTRO_LINES)
	items_collected = true


func _on_dialogue_box_dialogue_closed() -> void:
	if not items_collected:
		$Level3/Player.enable()
		$Level3.show()
	else:
		get_tree().change_scene_to_file("res://Scenes/Menu.tscn")
