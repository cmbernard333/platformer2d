extends Node2D

@onready var score_text: Label = get_node("LevelUI/ScoreText")
@onready var score: int = 0

func _on_end_level(next_level):
	get_tree().change_scene_to_file.call_deferred(next_level)

func _on_game_over():
	get_tree().reload_current_scene.call_deferred()
	
func _on_coin_collected(amount: int) -> void:
	score += amount
	score_text.text = str("Score: ", score)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.game_over.connect(_on_game_over)
	SignalBus.coin_collected.connect(_on_coin_collected)
	SignalBus.end_level.connect(_on_end_level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
