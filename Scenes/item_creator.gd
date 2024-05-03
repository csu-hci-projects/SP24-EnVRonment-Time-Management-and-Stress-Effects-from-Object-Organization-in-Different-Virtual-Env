extends Node3D

@export var category = 0

var items = [
	["res://Scenes/Items/itemScenes/duck.tscn", "res://Scenes/Items/itemScenes/penguin.tscn", "res://Scenes/Items/itemScenes/stegosaurus.tscn"],
	["res://Scenes/Items/itemScenes/burger.tscn", "res://Scenes/Items/itemScenes/strawberry.tscn", "res://Scenes/Items/itemScenes/donut.tscn"],
	["res://Scenes/Items/itemScenes/keyboard.tscn", "res://Scenes/Items/itemScenes/monitor.tscn", "res://Scenes/Items/itemScenes/notebook.tscn"],
]

func _ready():
	
	var done = false
	
	while !done:
		if Global.itemCounts[category] < Global.numItems:
			var item = load(items[category].pick_random()).instantiate()
			item.global_position = global_position
			get_parent().add_child(item)
			Global.itemCounts[category] += 1
			done = true
		category += 1
		
	print(Global.itemCounts)
		
	queue_free()
