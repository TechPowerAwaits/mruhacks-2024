extends Control

const INTRO_LINES := 4
const INTRO_FILE := "res://IntroDialogue1.txt"

const OUTRO_LINES := 3
const OUTRO_FILE := "res://OutroDialogue1.txt"

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO

var items_collected := false


func _ready() -> void:
	$Level1/Player.set_player_state(Player.PlayerType.LEVEL1)
	$Level1.hide()
	$Level1/Player.set_bounds(min_pos, max_pos)
	$Level1/Player.disable()
	$DialogueBox.load_text(INTRO_FILE, INTRO_LINES)


func _on_collectible_manager_all_collected() -> void:
	$Level1.hide()
	$Level1/Player.disable()
	$DialogueBox.load_text(OUTRO_FILE, OUTRO_LINES)
	items_collected = true


func _on_dialogue_box_dialogue_closed() -> void:
	if not items_collected:
		$Level1/Player.enable()
		$Level1.show()
	else:
		get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")
