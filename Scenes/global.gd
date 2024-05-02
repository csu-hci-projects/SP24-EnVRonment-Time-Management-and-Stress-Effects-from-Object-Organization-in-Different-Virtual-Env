extends Node

var errorCount = 0.0
var itemsSorted = 0.0
var time = 0.0
var started = false
var numItems = 5

var itemCounts = [0,0,0]

var experimentCount = 1

func reset_test():
	errorCount = 0
	time = 0
	experimentCount += 1
	
	
func _process(delta):
	if started:
		time += 1*delta
		
		
func record_data():
	var file = FileAccess.open("user://data.txt", FileAccess.WRITE)
	
	file.store_string("-----Test " + str(experimentCount) + "-----")
	file.store_string("Error rate: " + str(errorCount/itemsSorted))
	file.store_string("Time taken (seconds): " + str(time))
	
	file.close()
