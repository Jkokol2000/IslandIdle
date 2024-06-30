extends Node2D

var resources
var current_time = "Day"
# Called when the node enters the scene tree for the first time.
func _ready():
	resources = {"Food": "res://Resources/Materials/Food.tres", "Scrap": "res://Resources/Materials/Scrap.tres", "Water": "res://Resources/Materials/Water.tres", "Wood": "res://Resources/Materials/Wood.tres"}
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



