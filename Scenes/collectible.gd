extends Area2D

signal collected(type)

@export var type := "water bottle":
	set = set_type,
	get = get_type


func _ready() -> void:
	# Ensure that the collectible sprite represents its state.
	set_type(type)


func get_type() -> String:
	return type


func set_type(value: String) -> void:
	type = value
	$AnimatedSprite2D.play(value)


func _on_body_entered(_body: Node2D) -> void:
	emit_signal("collected", type)


func _on_collected(_type: Variant) -> void:
	queue_free()
