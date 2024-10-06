extends TileMapLayer

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO


func _ready() -> void:
	$Player.set_bounds(min_pos, max_pos)


func _on_collectible_manager_all_collected() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level2.tscn")
