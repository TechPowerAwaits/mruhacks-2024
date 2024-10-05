extends CharacterBody2D

const L1_IMAGE: Texture = preload("res://Assets/Level1/player lvl 1.png")
const FALLBACK_IMAGE: Texture = preload("res://Assets/Level1/Player.png")


enum PlayerType {
	LEVEL1,
	LEVEL2,
	LEVEL3
}

@export var cell_size := 16
@export var player_state := PlayerType.LEVEL1:
	get = get_player_state,
	set = set_player_state


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


func set_player_state(value: PlayerType) -> void:
	match value:
		PlayerType.LEVEL1:
			$Sprite2D.texture = L1_IMAGE
		_:
			$Sprite2D.texture = FALLBACK_IMAGE


func get_player_state() -> PlayerType:
	return player_state
