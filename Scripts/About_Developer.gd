extends Control

var youtube = "https://www.youtube.com/@Ghaithzezo"
var twitter = "https://twitter.com/Ghaith_zezo"


#OS.shell.open()



func _on_Area2D_input_event(viewport, event, shape_idx):
	pass # Replace with function body.


func _on_Area2D_mouse_entered():
	if Input.is_action_just_pressed("mouse"):
		OS.shell.open(twitter)
		print("twitter")
	pass # Replace with function body.




func _on_instagram_pressed():
	OS.shell_open("https://instagram.com/ghaith.zezo?igshid=ZDdkNTZiNTM=")
	pass # Replace with function body.


func _on_youtube_pressed():
	OS.shell_open("https://www.youtube.com/@Ghaithzezo")
	pass # Replace with function body.


func _on_twitter_pressed():
	OS.shell_open("https://twitter.com/Ghaith_zezo")
	pass # Replace with function body.


func _on_bACK_pressed():
	get_tree().change_scene("res://Objects/start_main.tscn")
	pass # Replace with function body.
