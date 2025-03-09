extends Sprite2D

@export var Bullet : PackedScene
@onready var _stream_player := $CannonSFX
#@export var weapon_sound : AudioEffect:
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	
func get_input():
	# Get sprite to follow mouse
	look_at(get_global_mouse_position())
	# Check if the fire weapon was triggered
	if Input.is_action_just_pressed("fire_weapon"):
		shoot()

func shoot():
	var b = Bullet.instantiate()
	get_tree().root.add_child(b)
	b.transform = $Marker2D.global_transform
	_stream_player.play()
	
