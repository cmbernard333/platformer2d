extends Area2D

@export_file("*.tscn") var next_level

func _on_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		SignalBus.end_level.emit(next_level)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
