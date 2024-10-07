extends Node

var snake: CharacterBody2D
var direction: Vector2
var speed: int = 200

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake = get_node("Snake")
	var viewport_size = get_viewport().size
	snake.position = viewport_size / 2
	
	direction = Vector2.DOWN


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_pressed("ui_down"):
	snake.position += direction * speed * delta

func _input(event: InputEvent) -> void:		
	if event.is_action_pressed("ui_down"):
		direction = Vector2.DOWN
	elif event.is_action_pressed("ui_up"):
		direction = Vector2.UP
	elif event.is_action_pressed("ui_right"):
		direction = Vector2.RIGHT
	elif event.is_action_pressed("ui_left"):
		direction = Vector2.LEFT 	
