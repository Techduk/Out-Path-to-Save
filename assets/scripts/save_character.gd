extends CharacterBody2D


const SPEED = 175.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Anim.play("jump")
	
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$Anim.play("walk")
		else:
			$Anim.play("jump")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$Anim.play("idle")
		else:
			$Anim.play("jump")
		
	if Input.is_action_pressed("move_right"):
		$Anim.flip_h = false
	if Input.is_action_pressed("move_left"):
		$Anim.flip_h = abs(scale.x)

	move_and_slide()
