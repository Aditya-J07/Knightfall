extends Node2D

@onready var finalscore: Label = $finalscore

func _ready() -> void:
	finalscore.text = "Final Score : "  + str(Points.pointssc)

func _on_button_pressed() -> void:
	Points.pointssc = 0
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	
	
	


func _on_button2_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_8.tscn")
