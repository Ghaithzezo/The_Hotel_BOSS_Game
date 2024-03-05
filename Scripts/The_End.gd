extends Control



func _on_Button_pressed():
	queue_free()
	get_tree().change_scene("res://Objects/About_Developer.tscn")
	pass # Replace with function body.
