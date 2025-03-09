extends Sprite2D

@export var speed = 400
var velocity := Vector2(0, 0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func get_input(delta :float):
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = input_direction * speed
	position += velocity * delta
	
func _process(delta):
	get_input(delta)
	
	
	
	
