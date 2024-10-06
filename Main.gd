extends Node

var snake: CharacterBody2D;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake = get_node("Snake")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("ui_down"):
		#snake.position += Vector2(0, 20)
	pass

func _input(event: InputEvent) -> void:		
	if event.is_action_pressed("ui_down"):
		snake.position += Vector2(0, 5)
	elif event.is_action_pressed("ui_up"):
		snake.position += Vector2(0, -5)
	elif event.is_action_pressed("ui_right"):
		snake.position += Vector2(5, 0)
	elif event.is_action_pressed("ui_left"):
		snake.position += Vector2(-5, 0)
