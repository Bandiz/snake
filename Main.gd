extends Node

var score: int = 0

func _ready() -> void:
	var viewport_size = get_viewport().size
	$Snake.position = viewport_size / 2
	
	SignalBus.food_eaten.connect(_increase_score)
	SignalBus.game_over.connect(_on_game_over)
	
func _increase_score() -> void:
	score += 1
	print("Current score: " + str(score))
	
func _on_game_over() -> void:
	print("Final score: " + str(score))
