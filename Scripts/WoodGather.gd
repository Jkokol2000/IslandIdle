extends Button

signal upgrade_speed

@export var GatherMaterial: MaterialResource
@export var upgradeCost = {}
@export var UpgradeButton: Button
var click_amount = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GatherMaterial.numberOfBuildings > 0:
		UpgradeButton.visible = true
		modulate.a = 0
	else:
		UpgradeButton.visible = false


func _on_pressed():
	GatherMaterial.currentAmount += click_amount
	



func _on_click_upgrade_button_successful_upgrade():
	click_amount = click_amount * 3


func _on_wood_button_start_timer():
	if $MaterialComponent.timer.is_stopped():
		$MaterialComponent.timer.start($MaterialComponent.timeToIncrease)


func _on_food_button_start_timer():
	pass # Replace with function body.


func _on_water_button_start_timer():
	pass # Replace with function body.


func _on_main_scene_debug_resource_gen():
	GatherMaterial.currentAmount += 1000


func _on_wood_speed_upgrade_pressed():
	if GatherMaterial.name == "Wood":
		emit_signal("upgrade_speed")


func _on_water_speed_upgrade_pressed():
	if GatherMaterial.name == "Water":
		emit_signal("upgrade_speed")


func _on_food_speed_upgrade_pressed():
	if GatherMaterial.name == "Food":
		emit_signal("upgrade_speed")


func _on_canvas_layer_reset_game():
	GatherMaterial.currentAmount = 10
	GatherMaterial.numberOfBuildings = 0
