extends CharacterBody2D

func _physics_process(delta):
	velocity = Vector2(0,0)
	var speed = 200
	if Input.is_action_pressed("move_right"):
		print("right button pressed")
		velocity.x = speed
	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	if Input.is_action_pressed("move_up"):
		velocity.y = -speed
	if Input.is_action_pressed("move_down"):
		velocity.y = speed
	move_and_slide()
