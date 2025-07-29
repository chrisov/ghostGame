class_name State_Walk extends State

@export var move_speed : float = 100.0

@onready var idle: State = $"../idle"

func		Enter() -> void:
	player._updateAnimation("walk")
	pass

func		Exit() -> void:
	pass

func		Process(_delta: float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	player.velocity = player.direction * move_speed
	if player._setDirection():
		player._updateAnimation("walk")
	return null

func		Physics(_delta: float) -> State:
	return null

func		HandleInput(_event: InputEvent) -> State:
	player.velocity = Vector2.ZERO
	return null
