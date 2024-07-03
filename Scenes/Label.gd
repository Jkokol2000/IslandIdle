extends Label

var upgrade_number = 1

func _ready():
	var new_sb = StyleBoxFlat.new()
	new_sb.bg_color = Color.BLACK
	set_custom_minimum_size(Vector2(100, 100))
	add_theme_stylebox_override("normal", new_sb)

func _process(delta):
	if get_parent().name != "WoodSpeedUpgrade":
		text = "Wood: " + str(upgrade_number * 10)
