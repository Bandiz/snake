extends CharacterBody2D
class_name Snake

@export var speed = 300.0
@export var is_paused = true
var direction = Vector2.DOWN
var tail_segments = []

func _ready() -> void:
	SignalBus.game_over.connect(_on_game_over)
	is_paused = false
	
func _on_game_over() -> void:
	is_paused = true
	position = get_viewport_rect().size / 2
	for segment in tail_segments:
		segment.queue_free()
	tail_segments.clear()

func _physics_process(delta: float) -> void:
	if (is_paused):
		return
	
	var previous_position = position
	var collision = move_and_collide(direction * speed * delta)
	
	if collision:
		var collider = collision.get_collider()
		if collider is Food:
			collider.eat()
			_add_tail_segment(previous_position)
		if collider is Wall:
			SignalBus.game_over.emit()
			
	_update_tail_positions(previous_position)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_down") and direction != Vector2.UP:
		direction = Vector2.DOWN
	elif event.is_action_pressed("ui_up") and direction != Vector2.DOWN:
		direction = Vector2.UP
	elif event.is_action_pressed("ui_right") and direction != Vector2.LEFT:
		direction = Vector2.RIGHT
	elif event.is_action_pressed("ui_left") and direction != Vector2.RIGHT:
		direction = Vector2.LEFT

func _add_tail_segment(position: Vector2) -> void:
	var tail_segment = Tail.new(position)
	add_child(tail_segment)
	tail_segments.append(tail_segment)

func _update_tail_positions(previous_position: Vector2) -> void:
	if tail_segments.size() > 0:
		var last_position = previous_position
		for segment in tail_segments:
			var temp_position = segment.position
			segment.position = last_position
			last_position = temp_position
