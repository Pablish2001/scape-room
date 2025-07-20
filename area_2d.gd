extends CharacterBody2D


const SPEED = 300.0

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	input_vector.y = Input.get_axis("ui_up","ui_down")
	input_vector.x = Input.get_axis("ui_left", "ui_right")
	input_vector = input_vector.normalized()
	
	if input_vector:
		velocity = input_vector * SPEED
		if abs(input_vector.x) == abs(input_vector.y) || abs(input_vector.x) > abs(input_vector.y):
			sprite.animation = "walk"
			sprite.flip_h = input_vector.x > 0
		else:
			if input_vector.y > 0:
				sprite.animation="down_walk"
			else:
				sprite.animation="up_walk"
		sprite.play()	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
		sprite.animation = "idle"
		sprite.play()

	move_and_slide()
