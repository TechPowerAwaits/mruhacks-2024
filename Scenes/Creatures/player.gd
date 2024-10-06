class_name Player
extends CharacterBody2D

const L1_IMAGE: Texture = preload("res://Assets/Level1/player_lvl_1.png")
const FALLBACK_IMAGE: Texture = preload("res://Assets/Level1/Player.png")

var _disabled := false
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
@export var speed := 64


func _ready() -> void:
	# Ensure that the player sprite represents the player state.
	set_player_state(player_state)


func disable() -> void:
	$Camera2D.enabled = false
	_disabled = true


func enable() -> void:
	$Camera2D.enabled = true
	_disabled = false


func _enforce_bounds():
	if position.x > _max_bounds.x:
		position.x = _max_bounds.x
	elif position.x < _min_bounds.x:
		position.x = _min_bounds.x
	
	if position.y > _max_bounds.y:
		position.y = _max_bounds.y
	elif position.y < _min_bounds.y:
		position.y = _min_bounds.y


func _move() -> void:
	var x_modifier := 0
	var y_modifier := 0
	
	if Input.is_action_pressed("Move down"):
		y_modifier += speed
	if Input.is_action_pressed("Move up"):
		y_modifier += -speed
	if Input.is_action_pressed("Move left"):
		x_modifier += -speed
	if Input.is_action_pressed("Move right"):
		x_modifier += speed
	
	velocity.x = x_modifier
	velocity.y = y_modifier
	move_and_slide()


func _physics_process(_delta: float) -> void:
	if not _disabled:
		_enforce_bounds()
		_move()


func set_bounds(min_pos: Vector2, max_pos: Vector2) -> void:
	_min_bounds = min_pos
	_max_bounds = max_pos


func set_player_state(value: PlayerType) -> void:
	match value:
		PlayerType.LEVEL1:
			$AnimatedSprite2D.play("level1")
		PlayerType.LEVEL2:
			$AnimatedSprite2D.play("level2")
		PlayerType.LEVEL3:
			$AnimatedSprite2D.play("level3")
	player_state = value


func get_player_state() -> PlayerType:
	return player_state
