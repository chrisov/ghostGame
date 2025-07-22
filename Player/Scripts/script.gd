class_name Player extends CharacterBody2D

var move_speed : float = 100.0

func _process(delta):
	var direction : Vector2 = Vector2.ZERO
	
	direction.x = Input.get_action_strength("goRight") - Input.get_action_strength("goLeft")
	direction.y = Input.get_action_strength("goDown") - Input.get_action_strength(("goUp"))
	
	velocity = direction * move_speed
	
func _physics_process(delta):
	move_and_slide()
