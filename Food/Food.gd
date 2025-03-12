extends StaticBody2D
class_name Food

@export var margin_right: int = 0
@export var margin_left: int = 0
@export var margin_top: int = 0
@export var margin_bottom: int = 0

func eat() -> void:
	SignalBus.food_eaten.emit()
	var rect: Rect2 = get_viewport_rect()
	position = Vector2(
		randi_range(margin_left, rect.end.x - margin_right), 
		randi_range(margin_top, rect.end.y - margin_bottom)
	)
