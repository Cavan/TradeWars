extends Area2D
@onready var _stream_player := $BulletImpactSFX
@export var _impact_vfx : PackedScene
var speed = 750
var rotation_speed :float = 15.0
const ENEMY_COLLISION :int = 2

func _ready():
	_stream_player.connect("finished", Callable(self, "_on_finished"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	position += transform.x * speed * delta
	$Sprite2D.rotate(delta * rotation_speed)
	
func _on_Bullet_body_entered(body):
	pass
	#if body.is_in_group("enemies"):
		#body.queue_free()
	#_stream_player.play()
	
func _on_finished() -> void:
	print("Callable")
	queue_free() # Free node when sfx is completed



func _on_area_entered(area :Area2D) -> void:
	if area.collision_layer == ENEMY_COLLISION:
		print("Bullet has impacted")
		_stream_player.play()
		$Sprite2D.set_visible(false)
		_display_impact_explosion()
		
func _display_impact_explosion() -> void:
	var b = _impact_vfx.instantiate()
	get_tree().root.add_child(b)
	b.transform = self.get_transform()
		
	
