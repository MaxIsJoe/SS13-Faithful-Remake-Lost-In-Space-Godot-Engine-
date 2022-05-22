extends StaticBody2D

onready var animationPlayer = $AnimationPlayer
onready var ray = $RayCast2D

var grid_size = 32
var inputs = {
	'ui_up': Vector2.UP,
	'ui_down': Vector2.DOWN,
	'ui_left': Vector2.LEFT,
	'ui_right': Vector2.RIGHT
}

func move(dir):
	var vector_pos = inputs[dir] * grid_size
	ray.cast_to = vector_pos
	ray.force_raycast_update()
	if !ray.is_colliding():
		animationPlayer.play("")
		return true
	return false