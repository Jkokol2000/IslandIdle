extends AnimatedSprite2D

var upgrade_number = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if upgrade_number == 1:
		visible = true
		play("Shack")
	elif upgrade_number == 10:
		play("House")
	elif upgrade_number == 100:
		play("Mansion")


func _on_click_upgrade_button_successful_upgrade():
	upgrade_number += 1
