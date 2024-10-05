extends TileMapLayer

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO


func _ready() -> void:
	$Player.set_bounds(min_pos, max_pos)
