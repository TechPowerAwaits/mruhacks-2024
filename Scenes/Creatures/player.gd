extends CharacterBody2D

const L1_IMAGE: Texture = preload("res://Assets/Level1/player_lvl_1.png")
const FALLBACK_IMAGE: Texture = preload("res://Assets/Level1/Player.png")

var _min_bounds := Vector2.ZERO
var _max_bounds := Vector2.ZERO


enum PlayerType {
	LEVEL1,
	LEVEL2,
	LEVEL3
}

@export var cell_size := 16
@export var player_state := PlayerType.LEVEL1:
	get = get_player_state,
	set = set_player_state


func _ready() -> void:
	# Ensure that the player sprite represents the player state.
	set_player_state(player_state)


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
	
	var future_pos := Vector2(position.x + x_modifier, position.y + y_modifier)
	
	if not (future_pos.x > _max_bounds.x or future_pos.x < _min_bounds.x):
		position.x += x_modifier
	if not (future_pos.y > _max_bounds.y or future_pos.y < _min_bounds.y):
		position.y += y_modifier


func set_bounds(min_pos: Vector2, max_pos: Vector2) -> void:
	_min_bounds = min_pos
	_max_bounds = max_pos


func set_player_state(value: PlayerType) -> void:
	match value:
		PlayerType.LEVEL1:
			$Sprite2D.texture = L1_IMAGE
		_:
			$Sprite2D.texture = FALLBACK_IMAGE
	player_state = value


func get_player_state() -> PlayerType:
	return player_state
