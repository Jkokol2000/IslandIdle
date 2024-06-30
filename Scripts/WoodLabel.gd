extends Label

@export var matComponent: MaterialComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if matComponent.materialToTrack != null:
		text = matComponent.materialToTrack.name + ": " + str(matComponent.materialToTrack.currentAmount)
		if matComponent.materialToTrack.numberOfBuildings >= 1:
			$UpgradeButton.visible = true
	else:
		text = "error"
	
