extends Node2D


var door = preload("res://Objects/Door.tscn")

func _on_Kye_Dark_Key_taken():
	var DOOR = door.instance()
	DOOR.position = Vector2(rand_range(20,40),40)
	add_child(DOOR)
	
	print("kkkk")
	pass 

