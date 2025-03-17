extends MarginContainer

@export var heal_ref : Control
@export var damage_ref : Control
@export var score_ref : Control

var check_health = preload("res://SystemControls/system_test_controls.tscn")

@onready var _score_label: Label = $HBoxContainer/ScoreLabel
@onready var _health_bar: ProgressBar = $HBoxContainer/HealthProgressBar

const SYSTEM_CONTROL_TESTS = preload("res://SystemControls/system_test_controls.tscn")

var _score := 0:
	set = _set_score

func _ready():
	heal_ref.health_added.connect(_on_set_health)
	damage_ref.health_damage.connect(_on_set_damage)
	score_ref.score_update.connect(_on_update_score)
	
	# Manually connect to a signal from another scene
		#var controls_instance = check_health.instantiate()
		#controls_instance.health_added.connect(_on_set_health)
		#get_parent().add_child(controls_instance)

func _set_score(score_in: int) -> void:
	_score += score_in
	_score_label.text = "%s" % _score


func _on_set_health(health_amount: int) ->void:
	_health_bar.value += health_amount
	print("Healing Player")

func _on_set_damage(health_hurt: int) ->void:
	_health_bar.value -= health_hurt
	print("Taking Damage")

func _setup_signals() -> void:
	#Health bar node
	pass
	
	
func _on_update_score() -> void:
	_set_score(150)

#func _on_system_test_controls_health_added(health_heal):
	#_health_bar.value += health_heal
#
#
#func _on_system_test_controls_health_damage(health_hurt):
	#_health_bar.value -= health_hurt
