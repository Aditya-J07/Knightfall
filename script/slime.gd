extends Node2D


const speed = 60

var direction = 1

@onready var rightray: RayCast2D = $AnimatedSprite2D/rightray
@onready var leftray: RayCast2D = $AnimatedSprite2D/leftray
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if rightray.is_colliding() :
		direction = -1
		animated_sprite_2d.flip_h = true
	if leftray.is_colliding() :
		direction = 1
		animated_sprite_2d.flip_h = false
	
	position.x += direction * speed * delta
