class_name CollectibleManager
extends Node

# We know that all_collected is unused within script.
@warning_ignore("UNUSED_SIGNAL")
signal all_collected
signal collected(type)

var _collectible_counter := 0: get = get_collectible_count

func _init() -> void:
	child_entered_tree.connect(_on_child_entered_tree)
	collected.connect(_on_collected)


func get_collectible_count() -> int:
	return _collectible_counter


func _on_child_entered_tree(node: Node) -> void:
	if node is Collectible:
		node.collected.connect(_on_node_collected)
		_collectible_counter += 1


func _on_collected(_type: String) -> void:
	_collectible_counter -= 1
	if _collectible_counter <= 0:
		emit_signal("all_collected")


func _on_node_collected(type: String):
	emit_signal("collected", type)
