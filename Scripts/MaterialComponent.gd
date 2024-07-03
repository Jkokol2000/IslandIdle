extends Node2D

class_name MaterialComponent
@onready var upgradeSound = $"../UpgradeSound"

@onready var materialToTrack = get_parent().GatherMaterial
@onready var upgradeCost = get_parent().upgradeCost
@export var timer : Timer

var currentAmount: int
@export var timeToIncrease: float
@export var baseAmount: int

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.is_stopped() == true and materialToTrack.numberOfBuildings > 0:
		materialToTrack.currentAmount += baseAmount * materialToTrack.numberOfBuildings
		timer.start(timeToIncrease)

func increaseUpgradePrice():
	for key in upgradeCost:
		upgradeCost[key] *= 3
		


func _on_wood_gather_upgrade_speed():
		for key in upgradeCost:
			if key.currentAmount < upgradeCost[key]:
				return
			else:
				key.currentAmount -= upgradeCost[key]
				timeToIncrease = timeToIncrease *.5
				timer.start(timer.time_left * .5)
				upgradeSound.play()
			increaseUpgradePrice()
