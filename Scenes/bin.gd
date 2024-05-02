extends Node3D

@export var sortType = ""
var currentAmount = 0

func _ready():
	pass


func _process(delta):
	if sortType == "office":
		$Label3D.text = "Office Supplies\n" + str(currentAmount) + "/" + str(Global.numItems)
	elif sortType == "animals":
		$Label3D.text = "Animals\n" + str(currentAmount) + "/" + str(Global.numItems)
	else:
		$Label3D.text = "Food\n" + str(currentAmount) + "/" + str(Global.numItems)


func _on_area_3d_body_entered(body):
	print(body)
	if body is SortingItem:
		if body.type == sortType:
			currentAmount += 1
		else:
			Global.errorCount += 1
		Global.itemsSorted += 1


func _on_area_3d_body_exited(body):
	currentAmount -= 1
