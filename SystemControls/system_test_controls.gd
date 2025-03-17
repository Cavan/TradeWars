extends Control


@export var health_heal = 15
@export var health_hurt = 15

signal health_added(health_amount)
signal health_damage(health_hurt)
signal score_update
signal enemy_hit_damage

# @onready var healthBtn = get_node("MarginContainer/VBoxContainer/EnemyHealthTestBtn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_health_test_btn_pressed():
	health_added.emit(health_heal)
	
func _on_hurt_test_btn_pressed():
	health_damage.emit(health_hurt)

func _on_score_test_btn_pressed():
	score_update.emit()

func _on_enemy_health_test_btn_pressed():
	enemy_hit_damage.emit()
