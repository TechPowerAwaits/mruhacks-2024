extends CharacterBody2D


@export var cell_size := 16


func _physics_process(_delta: float) -> void:
	var x_modifier := 0
	var y_modifier := 0
	
	if Input.is_action_pressed("Move down"):
		y_modifier += cell_size
	if Input.is_action_pressed("Move up"):
		y_modifier += -cell_size
	if Input.is_action_pressed("Move left"):
		x_modifier += -cell_size
	if Input.is_action_pressed("Move right"):
		x_modifier += cell_size
	
	position.x += x_modifier
	position.y += y_modifier
