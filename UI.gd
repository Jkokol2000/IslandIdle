extends CanvasLayer
class_name UI
@export var Resources = []
@onready var WoodAmount = $Control/HBoxContainer/WoodLabel
@onready var FoodAmount = $Control/HBoxContainer/FoodLabel
@onready var WaterAmount = $Control/HBoxContainer/WaterLabel

func _process(delta):
	FoodAmount.text = str(Resources[0].currentAmount)
	WaterAmount.text = str(Resources[1].currentAmount)
	WoodAmount.text = str(Resources[2].currentAmount)
