extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 150

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	input_vector.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	input_vector = input_vector.normalized()

	# Print input for debugging
	if input_vector != Vector2.ZERO:
		print("Input Vector: ", input_vector)
	else:
		print("No input")

	# Movement
	velocity = input_vector * SPEED
	move_and_slide()

	# Animation logic
	if input_vector == Vector2.ZERO:
		anim.play("Idle")
	else:
		if abs(input_vector.x) > abs(input_vector.y):
			if input_vector.x > 0:
				anim.play("Right")
			else:
				anim.play("Left")
		else:
			if input_vector.y > 0:
				anim.play("Down")
			else:
				anim.play("Up")
