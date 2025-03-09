extends Area2D

#@onready var impact_vfx = $ImpactEffect
@onready var enemy_sprite = $enemySprite
@onready var hit_flash = $enemySprite/HitFlashPlayer

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
	enemy_sprite.rotate(deg_to_rad(90))
	hit_flash.play("flash")
	
	

