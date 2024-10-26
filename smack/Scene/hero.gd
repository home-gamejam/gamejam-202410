extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX := Input.get_axis("ui_left", "ui_right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var directionY := Input.get_axis("ui_up", "ui_down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	
	if directionX != 0:
		if directionX < 0:
			$AnimatedSprite2D.flip_h = false
		else:
			$AnimatedSprite2D.flip_h = true
			
		$AnimatedSprite2D.play("left")
	elif directionY < 0:
		$AnimatedSprite2D.play("up")
	elif directionY > 0:
		$AnimatedSprite2D.play("down")
	else:
		$AnimatedSprite2D.play("idle")
	move_and_slide()
