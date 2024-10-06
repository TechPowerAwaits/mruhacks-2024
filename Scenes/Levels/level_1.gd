extends Control

const INTRO_LINES := 5
const INTRO_FILE := "res://IntroDialogue1.txt"

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO


func _ready() -> void:
	$Level1.hide()
	$Level1/Player.set_bounds(min_pos, max_pos)
	$Level1/Player.toggle_focus()
	$DialogueBox.load_text(INTRO_FILE, INTRO_LINES)


func _on_collectible_manager_all_collected() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")


func _on_dialogue_box_dialogue_closed() -> void:
	$Level1/Player.toggle_focus()
	$Level1.show()
