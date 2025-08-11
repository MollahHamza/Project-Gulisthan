extends CharacterBody2D

@onready var anim = $AnimatedSprite2D

const SPEED = 150

func _physics_process(delta):
	var input_vector = Vector2.ZERO

	# Get movement input
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()

	# Apply movement
	velocity = input_vector * SPEED
	move_and_slide()

	# Choose animation
	if input_vector == Vector2.ZERO:
		anim.play("idle")
	else:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				anim.play("right")
			else:
				anim.play("left")
		else:
			if input_vector.y > 0:
				anim.play("down")
			else:
				anim.play("up")
