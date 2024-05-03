extends Node

var errorCount = 0.0
var itemsSorted = 0.0
var time = 0.0
var started = true
var numItems = 5

var itemCounts = [0,0,0]

var experimentCount = 1
var scenes = ["res://Forest Scene/forest.tscn","res://Forest Scene2/forest2.tscn","res://Forest Scene3/forest3.tscn"]


func _ready():
	var file = FileAccess.open("user://data.txt", FileAccess.READ_WRITE)
	file.seek_end()
	file.store_string("==========EXPERIMENT AT " + Time.get_time_string_from_system() + " ON " + Time.get_date_string_from_system() + "==========\n")
	file.close()


func reset_test():
	if experimentCount < 3:
		errorCount = 0
		time = 0
		itemsSorted = 0
		get_tree().change_scene_to_file(scenes[experimentCount])
		experimentCount += 1
		started = true
		itemCounts = [0,0,0]
	
	
func _process(delta):
	if started:
		time += 1*delta
		
		if itemsSorted >= numItems*3:
			started = false
			record_data()
			reset_test()
		
		
func record_data():
	var file = FileAccess.open("user://data.txt", FileAccess.READ_WRITE)
	file.seek_end()
	file.store_string("-----Test " + str(experimentCount) + "-----\n")
	file.store_string("Error rate: " + str(errorCount/itemsSorted) + "\n")
	file.store_string("Time taken (seconds): " + str(time) + "\n")
	file.close()
