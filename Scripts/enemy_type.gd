extends Resource

class_name EnemyType

##
# Enemy type allows the customization of the main enemy script with the following:
# display_name: the name of this enemy
# move_speed: how quickly this enemy moves
# move_dir: which direction this enemy moves
# texture: the texture to use for this enemy
##

@export var display_name: String = "Enemy"
@export var move_speed: float = 30.0
@export var move_dir: Vector2
@export var texture: Texture
