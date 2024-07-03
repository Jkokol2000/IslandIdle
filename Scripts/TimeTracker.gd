extends Node2D

@export var FoodResource : MaterialResource
@export var WaterResource : MaterialResource
@export var EventList : Array
@onready var DayTimer = $TimeLength
@onready var Anim = $ProtoTimeTracker
var is_daytime = true
var day_number = 1
var animation_frame = 0
var event_int = 0
signal game_win
signal game_loss
# Called when the node enters the scene tree for the first time.
func _ready():
	Anim.frame = 0
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Label.text = "Day " + str(day_number)
	if day_number == 30:
		emit_signal("game_win")


func _on_time_length_timeout():
	animation_frame += 1
	if  animation_frame != 9:
		Anim.frame = animation_frame
	else:
		animation_frame = 0
		Anim.frame = animation_frame
		change_time_of_day()
		
func change_time_of_day():
	day_number += 1
	event_int = randi_range(1, 10)
	if event_int > 5:
		trigger_event(choose(EventList))
	if FoodResource.currentAmount >= 20 * day_number or WaterResource.currentAmount >= 20 * day_number:
		FoodResource.currentAmount -= 20 * day_number
		WaterResource.currentAmount -= 20 * day_number
	else:
		emit_signal("game_loss")
func trigger_event(event: Event):
#	get_tree().paused = true
#	EventPanel.visible = true
#	EventPanel.event_name = event.name
#	EventPanel.event_effect = event.description
#	for resource in event.effect:
#		resource.currentAmount += event.effect[resource]
	pass		
func choose(array):
	array.shuffle()
	return array.front()


func _on_button_pressed():
	get_tree().paused = false
