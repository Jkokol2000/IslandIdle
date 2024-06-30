extends Button

@export var BuildingResource: MaterialResource
@export var buildingCost: Dictionary
@export var upgrade_cost_display: Label

var upgrade_string = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if upgrade_cost_display != null and upgrade_cost_display.visible == true:
		upgrade_cost_display.global_position = get_viewport().get_mouse_position() + Vector2(10,10)
		

func _on_pressed():
	if buildingCost != null:
		print(buildingCost)
		for key in buildingCost:
			print(key)
			if key.currentAmount < buildingCost[key]:
				print("Not enough materials")
				return
			else:
				key.currentAmount -= buildingCost[key]
		BuildingResource.numberOfBuildings += 1
		increase_cost()
	else:
		print("no building cost")

func increase_cost():
	for key in buildingCost:
		buildingCost[key] *= 2
		print(buildingCost[key])
	if upgrade_cost_display.visible:
		upgrade_string = ""
		display_cost()

func display_cost():
	for key in buildingCost:
		upgrade_string += key.name + ": " + str(buildingCost[key]) + "\n"
	upgrade_cost_display.text = upgrade_string

func _on_mouse_entered():
	display_cost()
	upgrade_cost_display.visible = true
	
	


func _on_mouse_exited():
	upgrade_cost_display.visible = false
	upgrade_string = ""
