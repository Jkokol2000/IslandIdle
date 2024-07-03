extends Resource

class_name MaterialResource

@export var name: String

var currentAmount = 10
var numberOfBuildings = 0
var percentUpgrades = 1.00

func _ready():
	currentAmount = 10
