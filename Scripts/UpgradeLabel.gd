extends Label

@onready var MaterialComp = $"../MaterialComponent"
var upgrade_text = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.BLACK
	set_custom_minimum_size(Vector2(100, 100))
	add_theme_stylebox_override("normal", new_sb)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		global_position = get_viewport().get_mouse_position() + Vector2(10,10)

func _on_upgrade_button_mouse_entered():
	visible = true
	show_upgrade_cost()
	text = upgrade_text

func _on_upgrade_button_mouse_exited():
	visible = false
	upgrade_text = ""
	text = ""
func show_upgrade_cost():
	if MaterialComp != null:
		for key in MaterialComp.upgradeCost:
			upgrade_text += key.name + ": " + str(MaterialComp.upgradeCost[key]) + "\n"
	else:
		print("error")
		
