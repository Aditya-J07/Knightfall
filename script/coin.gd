extends Area2D

signal coin_collected

@onready var gamemanager: Node = %gamemanager
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	animation_player.play("pickupanimation")
	emit_signal("coin_collected")
