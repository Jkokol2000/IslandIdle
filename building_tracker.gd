extends Node2D

@onready var anim = $Building
@export var resource : MaterialResource
@export var building_threshold : int

var sound_has_played = false
var second_stage = false
var third_stage = false

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	match resource.name:
		"Food":
			anim.play("Fishery_Day")
		"Water":
			anim.play("Well_Day")
		"Wood":
			anim.play("Wood_Building_Day_Empty")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if resource.numberOfBuildings >= building_threshold:
		visible = true
		if sound_has_played == false:
			$AudioStreamPlayer.play()
			sound_has_played = true
		if resource.name == "Wood":
			if building_threshold == 1:
				building_threshold = 10
			if building_threshold == 10:
				building_threshold = 20
	if resource.name == "Wood":
		if resource.numberOfBuildings == 1:
			visible = true
		if resource.numberOfBuildings == 10:
			anim.play("Wood_Building_Day_Sprouts")
			visible = true
		if resource.numberOfBuildings == 20:
			anim.play("Wood_Building_Day_Grown")
			visible = true
		else:
			sound_has_played = false
	
