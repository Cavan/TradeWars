extends MarginContainer

var _score := 0:
	set = _set_score

@onready var _score_label: Label = %HBoxContainer/ScoreLabel



func _ready():
	#_set_score(9)
	pass

func _set_score(score_in: int) -> void:
	_score = score_in
	_score_label.text = "%07b" % _score
