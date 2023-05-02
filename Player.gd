extends KinematicBody2D

export var max_health := 5
export var speed := 150.0
export var drag_factor := 5.0
export(int) var FRICTION = 10

var velocity := Vector2.ZERO
var fast_fall = false

func _physics_process(_delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	print(input_vector)
	var move_direction := input_vector.normalized()
	var desired_velocity := speed * move_direction
	var steering := desired_velocity - velocity
	velocity += steering / drag_factor
	velocity = move_and_slide(velocity, Vector2.ZERO)
	while input_vector.x > 0 and input_vector.y > 0:
		if input_vector.x == -1 and input_vector.y == -1:#LU
			$AnimatedSprite.animation = "Running_LU"
		if input_vector.x == -1 and input_vector.y == 1:#LD
			$AnimatedSprite.animation = "Running_LD"
		if  input_vector.x == 1 and input_vector.y == -1:#UR
			$AnimatedSprite.animation = "Running_UR"
		if input_vector.x == 1 and input_vector.y == 1:#DR
			$AnimatedSprite.animation = "Running_DR"
		if input_vector.x == 0 and input_vector.y == -1:
			$AnimatedSprite.animation = "Running_U"
		if input_vector.x == 0 and input_vector.y == 1:
			$AnimatedSprite.animation = "Running_D"			
		if input_vector.x == -1 and input_vector.y == 0:
			$AnimatedSprite.animation = "Running_L"			
		else:
			$AnimatedSprite.animation = "Running_R"
			
