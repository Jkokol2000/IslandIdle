extends Button

var upgrade_cost = 50
@export var resources = []
signal successful_upgrade

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = "Upgrade Click Yield: " + str(upgrade_cost) + " of each resource."


func _on_pressed():
	for resource in resources:
		if resource.currentAmount >= upgrade_cost:
			resource.currentAmount -= upgrade_cost
		else:
			return
	upgrade_cost *= 5
	emit_signal("successful_upgrade")
