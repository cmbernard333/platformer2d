extends CharacterBody2D

class_name Player

@export var move_speed: float = 100.0 # pixels/s
@export var jump_force: float = 200.0 # upwards velocity
@export var gravity: float = 500.0

# applies physics every frame
# TODO smooth acceleration and de-celeration
func _physics_process(delta: float) -> void:
	# if we are not on the floor, apply gravity based on the delta between frames
	if not is_on_floor():
		velocity.y += gravity * delta
	# check controls
	velocity.x = 0
	if Input.is_key_pressed(KEY_LEFT):
		velocity.x -= move_speed
	if Input.is_key_pressed(KEY_RIGHT):
		velocity.x += move_speed

	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = -jump_force
	# apply velocity to CharacterBody2D and process movement
	move_and_slide()

# default code added by godot
#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
#
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#move_and_slide()
