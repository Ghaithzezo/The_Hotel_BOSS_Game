extends CanvasLayer

func _ready():
	set_visible(false)
func _input(event):
	
	if event.is_action_pressed("ui_cancel"): # escape button by default
		set_visible(!get_tree().paused) # if not pause then hide
		get_tree().paused = !get_tree().paused # toggle pause status


func _on_Continue_pressed():
	print(9+5)
	get_tree().paused = false
	set_visible(false)
	
func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible


func _on_Button_pressed():
	OS.window_fullscreen = !OS.window_fullscreen
	pass 


func _on_Back_To_Main_Menu_pressed():
	get_tree().change_scene("res://Objects/start_main.tscn")
	pass # Replace with function body.

 

var master_bus = AudioServer.get_bus_index("master")

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(master_bus,value)
	
	if value == -30:
		AudioServer.set_bus_mute(master_bus, true)
		print("mute")
	else:
		AudioServer.set_bus_mute(master_bus, false)
		print("No_mute")
	pass # Replace with function body.
