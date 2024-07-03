extends ColorRect

var event_name = ""
var event_effect = ""
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$VBoxContainer/Label.text = event_name
	$VBoxContainer/RichTextLabel.text = event_effect
