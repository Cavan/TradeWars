extends Area2D

@export var enemy_hit_ref : Control

#@onready var impact_vfx = $ImpactEffect
@onready var enemy_sprite = $enemySprite
@onready var hit_flash = $enemySprite/HitFlashPlayer
@onready var enemy_health_bar = $enemySprite/EnemyHealth

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_entered(area: Area2D) -> void:
	take_damage(area)
	print("Enemy Body Entered")
	
func take_damage(area: Area2D) -> void:
	# Cycle damage indicator
	damage_indicator(area)
	
func damage_indicator(projectile: Area2D) -> void:
	#enemy_sprite.rotate(deg_to_rad(90))
	hit_flash.play("flash")
	damage_shake()
	enemy_health_bar.value -= 15
	if enemy_health_bar.value == 0:
		self.queue_free()

func damage_shake() -> void:
	# Get the current postion
	var current_position : Vector2 = enemy_sprite.position
	for i in range(10):
		enemy_sprite.position = Vector2(randi_range(50, 100), randi_range(50, 100))
	# After performing the damage shaking return to previous postion
	enemy_sprite.position = current_position
	

