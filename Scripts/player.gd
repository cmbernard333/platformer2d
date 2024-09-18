extends CharacterBody2D

class_name Player

@export var move_speed: float = 100.0 # pixels/s
@export var jump_force: float = 200.0 # upwards velocity
@export var gravity: float = 500.0

var score: int = 0

func add_score(amount: int) -> void:
	score += amount
	print("Player has %d points" % score)

func game_over():
	SignalBus.game_over.emit()
	
func _on_hit_player(damage: int) -> void:
	game_over()
	
func _on_coin_collected(amount: int) -> void:
	add_score(amount)
	
func _ready() -> void:
	SignalBus.hit_player.connect(_on_hit_player)
	SignalBus.coin_collected.connect(_on_coin_collected)

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
	
	if global_position.y > 100:
		game_over()
