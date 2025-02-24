extends Node

var score = 0

@onready var point: Label = %point


func add_point():
	score += 1
	point.text = str(score)
