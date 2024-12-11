extends CharacterBody2D

@onready var knight: AnimatedSprite2D = $Knight
const SPEED = 900.0
const JUMP_VELOCITY = -400.0 
const gravity = 900.0
const fallspeed = 1000.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if velocity.y > fallspeed:
		velocity.y = fallspeed

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Handle jump.
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	velocity.x = 0

	if Input.is_key_pressed(KEY_D):
		velocity.x = SPEED
		knight.flip_h = false
	elif Input.is_key_pressed(KEY_A):
		velocity.x = -SPEED
		knight.flip_h = true
	if Input.is_action_just_pressed("ui_select"):
		knight.play("Attack 1")
		
	if velocity.length() > 0:
		knight.play("Run")
	elif velocity.length() == 0:
		knight.play("Idle")

	move_and_slide()
