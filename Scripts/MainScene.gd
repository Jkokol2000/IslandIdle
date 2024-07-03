extends Node2D
signal debug_resource_gen
var current_time = "Day"
var current_day = 1
var score = 0
var high_score = 0
@export var resources = []
# Called when the node enters the scene tree for the first time.
func _ready():
	if get_tree().paused == true:
		get_tree().paused = false
func _process(delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	pass

func _on_time_tracker_game_win():
	for res in resources:
		score += res.currentAmount
	if high_score < score:
		high_score = score
	get_tree().paused = true


func _on_time_tracker_game_loss():
	get_tree().paused = true

