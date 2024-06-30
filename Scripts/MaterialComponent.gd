extends Node2D

class_name MaterialComponent

@onready var materialToTrack = get_parent().GatherMaterial
@onready var upgradeCost = get_parent().upgradeCost
@export var timer : Timer

var currentAmount: int
@export var timeToIncrease: float
@export var baseAmount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.start(timeToIncrease)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.is_stopped() == true:
		materialToTrack.currentAmount += baseAmount * materialToTrack.numberOfBuildings
		timer.start(timeToIncrease)


func _on_upgrade_button_pressed():
	for key in upgradeCost:
		if key.currentAmount < upgradeCost[key]:
			print("Not Enough Resources")
		else:
			key.currentAmount -= upgradeCost[key]
			timeToIncrease = timeToIncrease *.8
			timer.start(timer.time_left * .8)
			increaseUpgradePrice()

func increaseUpgradePrice():
	for key in upgradeCost:
		upgradeCost[key] *= 2
