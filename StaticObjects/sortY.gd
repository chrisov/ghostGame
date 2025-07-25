extends StaticBody2D

func _ready():
	# Sort this object based on its vertical position
	z_index = int(global_position.y)
