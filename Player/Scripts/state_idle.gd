class_name State_Idle extends State

@onready var walk: State = $"../walk"

func		Enter() -> void:
	player._updateAnimation("idle")
	pass

func		Exit() -> void:
	pass

func		Process(_delta: float) -> State:
	if player.direction != Vector2.ZERO:
		return walk
	return null

func		Physics(_delta: float) -> State:
	return null

func		HandleInput(_event: InputEvent) -> State:
	player.velocity = Vector2.ZERO
	return null
