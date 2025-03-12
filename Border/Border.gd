extends PanelContainer

class_name Border

@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

func _ready() -> void:
	connect("resized", _on_resize)

func _on_resize() -> void:
	var new_rect_shape = RectangleShape2D.new()
	new_rect_shape.size = size
	collision_shape_2d.position.x = size.x / 2.0
	collision_shape_2d.position.y = size.y / 2.0
	collision_shape_2d.shape = new_rect_shape

func _on_area_2d_body_exited(body: Node2D) -> void:
	SignalBus.game_over.emit()
