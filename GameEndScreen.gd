extends CanvasLayer

@onready var vbox = $PanelContainer/MarginContainer/VBoxContainer
var vbox_children
signal reset_game
# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	vbox_children = vbox.get_children()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_time_tracker_game_loss():
	visible = true
	vbox_children[0].text = "GAME OVER"
	vbox_children[1].text = "You ran out of resources"
	vbox_children[2].text = ""
	vbox_children[3].text = "Try Again?"


func _on_time_tracker_game_win():
	visible = true
	vbox_children[0].text = "YOU WIN"
	vbox_children[1].text = "You survived 30 days, and found the mainland!"
	vbox_children[2].text = "Score: " + get_parent().score + "     " + "High Score: " + get_parent().high_score
	vbox_children[3].text = "Play again?"


func _on_button_pressed():
	emit_signal("reset_game")
	get_tree().reload_current_scene()
	
