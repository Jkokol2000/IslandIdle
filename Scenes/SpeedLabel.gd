extends Label

var click_upgrades = 0
@export var wood_resource : MaterialResource
@export var water_resource : MaterialResource
@export var food_resource : MaterialResource


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.BLACK
	set_custom_minimum_size(Vector2(50, 50))
	add_theme_stylebox_override("normal", new_sb)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().name != "WoodSpeedUpgrade":
		text = "Wood: " + str(10 * (2 ** click_upgrades))
	else:
		text = "Food: " + str(5 * (2 ** click_upgrades)) + "\n" + "Water: " + str(5 * (2 ** click_upgrades))
	if visible == true:
		global_position = get_viewport().get_mouse_position() + Vector2(10,10)


func _on_wood_speed_upgrade_pressed():
	if get_parent().name == "WoodSpeedUpgrade" and water_resource.currentAmount >= 5*(2 ** click_upgrades) and food_resource.currentAmount >= 5*(2 ** click_upgrades):
		click_upgrades += 1


func _on_water_speed_upgrade_pressed():
	if get_parent().name == "WaterSpeedUpgrade" and wood_resource.currentAmount >= 10*(2 ** click_upgrades):
		click_upgrades += 1


func _on_food_speed_upgrade_pressed():
	if get_parent().name == "FoodSpeedUpgrade" and wood_resource.currentAmount >= 10*(2 ** click_upgrades):
		click_upgrades += 1


func _on_wood_speed_upgrade_mouse_entered():
	if get_parent().name == "WoodSpeedUpgrade":
		visible = true


func _on_wood_speed_upgrade_mouse_exited():
	if get_parent().name == "WoodSpeedUpgrade":
		visible = false


func _on_water_speed_upgrade_mouse_entered():
	if get_parent().name == "WaterSpeedUpgrade":
		visible = true

func _on_water_speed_upgrade_mouse_exited():
	if get_parent().name == "WaterSpeedUpgrade":
		visible = false
func _on_food_speed_upgrade_mouse_entered():
	if get_parent().name == "FoodSpeedUpgrade":
		visible = true
func _on_food_speed_upgrade_mouse_exited():
	if get_parent().name == "FoodSpeedUpgrade":
		visible = false
