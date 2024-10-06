extends TileMapLayer

@export var min_pos := Vector2.ZERO
@export var max_pos := Vector2.ZERO


func _ready() -> void:
	$Player.set_bounds(min_pos, max_pos)



func _on_collectible_collected(type: Variant) -> void:
	print("Congrat on collecting a collectable of type %s." % type)


func _on_collectible_manager_collected(type: Variant) -> void:
	print("The CollectibleManager notes %s has been collected." % type)


func _on_collectible_manager_all_collected() -> void:
	print("All collectibles have been collected.")
