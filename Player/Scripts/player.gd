class_name Player extends CharacterBody2D

var direction : Vector2 = Vector2.ZERO
var cardinal_direction : Vector2 = Vector2.ZERO

@onready var animation : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_machine: PlayerStateMachine = $StateMachine

func		_ready():
	cardinal_direction = Vector2.DOWN
	state_machine.Initialize(self)
	pass

func		_process(delta):
	direction.x = Input.get_action_strength("goRight") - Input.get_action_strength("goLeft")
	direction.y = Input.get_action_strength("goDown") - Input.get_action_strength(("goUp"))
	pass

func		_physics_process(delta):
	move_and_slide()

func		_setDirection() -> bool:
	var		new_dir : Vector2 = cardinal_direction
	
	if (direction == Vector2.ZERO):
		return false
	if (direction.y == 0):
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif (direction.x == 0):
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	if (new_dir == cardinal_direction):
		return false
	cardinal_direction = new_dir
	animation.scale.x = 1 if cardinal_direction == Vector2.LEFT else -1
	return true

func		_updateAnimation(_state : String):
	animation.play(_state + "_" + _getDirection())
	pass
	
func		_getDirection() -> String:
	if (cardinal_direction == Vector2.DOWN):
		return ("down")
	elif (cardinal_direction == Vector2.UP):
		return ("up")
	return ("left")
