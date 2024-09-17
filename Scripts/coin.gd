extends Area2D

class_name Coin

@export var bob_height: float = 5.0
@export var bob_speed: float = 5.0

@onready var start_y: float = global_position.y

var t: float = 0.0

@export var score_amount: int = 1

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		SignalBus.coin_collected.emit(score_amount)
		queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	t += delta
	var d = (sin(t * bob_speed) + 1) / 2
	global_position.y = start_y + (d * bob_height)
