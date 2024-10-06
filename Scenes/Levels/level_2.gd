extends Control

const INTRO_LINES := 2
const INTRO_FILE := "res://IntroDialogue2.txt"

const OUTRO_LINES := 2
const OUTRO_FILE := "res://OutroDialogue2.txt"

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO

var items_collected := false


func _ready() -> void:
	_on_dialogue_box_dialogue_closed()
	$Level2.hide()
	$Level2/Player.set_bounds(min_pos, max_pos)
	$Level2/Player.disable()
	$DialogueBox.load_text(INTRO_FILE, INTRO_LINES)


func _on_collectible_manager_all_collected() -> void:
	$Level2.hide()
	$Level2/Player.disable()
	$DialogueBox.load_text(OUTRO_FILE, OUTRO_LINES)
	items_collected = true


func _on_dialogue_box_dialogue_closed() -> void:
	if not items_collected:
		$Level2/Player.enable()
		$Level2.show()
	else:
		get_tree().change_scene_to_file("res://Scenes/Levels/level3.tscn")
