extends Button

@export var GatherMaterial: MaterialResource
@export var upgradeCost = {}
var click_amount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GatherMaterial.numberOfBuildings > 0:
		$UpgradeButton.visible = true
	else:
		$UpgradeButton.visible = false


func _on_pressed():
	GatherMaterial.currentAmount += click_amount
	



func _on_click_upgrade_button_successful_upgrade():
	click_amount += click_amount
