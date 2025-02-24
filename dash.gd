extends Node

@onready var dashtimer: Timer = $dashtimer

func start_dash(dur):
	dashtimer.wait_time = dur
	dashtimer.start()
	
func is_dashing():
	return !dashtimer.is_stopped()
