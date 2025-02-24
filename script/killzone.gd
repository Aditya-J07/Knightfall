extends Area2D

@onready var timer: Timer = $Timer
@onready var hit: AudioStreamPlayer2D = $hit


func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	hit.play()
	timer.start()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	Points.pointssc = 0
	get_tree().reload_current_scene()
	
