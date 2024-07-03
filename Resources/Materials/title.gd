extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene_to_file("res://Scenes/MainScene.tscn")
