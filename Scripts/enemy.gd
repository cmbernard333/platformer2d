extends Area2D

@export var enemy_type: EnemyType

var start_pos: Vector2
var target_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = global_position
	target_pos = start_pos + enemy_type.move_dir
	var sprite: Sprite2D = get_node("Sprite") 
	sprite.texture = enemy_type.texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# move this enemy toward the target position with the given speed once per frame
	# use delta here to stretch that vector over time
	global_position = global_position.move_toward(target_pos, enemy_type.move_speed * delta)
	if global_position == target_pos:
		if global_position == start_pos:
			target_pos = start_pos + enemy_type.move_dir
		else:
			target_pos = start_pos


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		SignalBus.hit_player.emit(1)
