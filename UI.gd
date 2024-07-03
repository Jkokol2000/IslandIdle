extends CanvasLayer
class_name UI
@export var Resources = []
@onready var WoodAmount = $Control/PanelContainer/HBoxContainer/WoodLabel
@onready var FoodAmount = $Control/PanelContainer/HBoxContainer/FoodLabel
@onready var WaterAmount = $Control/PanelContainer/HBoxContainer/WaterLabel

func _process(delta):
	FoodAmount.text = str(Resources[0].currentAmount)
	WaterAmount.text = str(Resources[1].currentAmount)
	WoodAmount.text = str(Resources[2].currentAmount)
