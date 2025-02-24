extends CanvasLayer

@onready var points: Label = $points


var coins = Points.pointssc

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	points.text = str(coins)

func _on_coin_collected() -> void:
		coins += 1
		Points.pointssc = coins
		print(Points.pointssc)
		_ready()


func _on_coin_coin_collected() -> void:
		coins += 1
		Points.pointssc = coins
		print(Points.pointssc)
		_ready()


func _on_coin_coin_coin_collected() -> void:
		coins += 1
		Points.pointssc = coins
		print(Points.pointssc)
		_ready()


func _on_coin_coin_coin_coin_collected() -> void:
		coins += 1
		Points.pointssc = coins
		print(Points.pointssc)
		_ready()


func _on_coin_coin_coin_coin_coin_collected() -> void:
		coins += 1
		Points.pointssc = coins
		print(Points.pointssc)
		_ready()
