extends Control

@export var MatComp: Button
@export var MaterialButtonColor: Texture
# Called when the node enters the scene tree for the first time.
func _ready():
	get_child(0).texture_progress = MaterialButtonColor
	get_child(0).value = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if MatComp.get_child(0).timer.is_stopped() == false:
		get_child(0).value = MatComp.get_child(0).timeToIncrease - MatComp.get_child(0).timer.time_left
		get_child(0).step = MatComp.get_child(0).timeToIncrease / 10
		get_child(0).max_value = MatComp.get_child(0).timeToIncrease
	else:
		get_child(0).value = 0
