extends Control

func _ready():
	$AudioStreamPlayer2D.playing = true

func _on_YES_pressed():
	get_tree().change_scene("res://Objects/HInt_Gost.tscn")
	pass # Replace with function body.


func _on_NO_pressed():
	get_tree().change_scene("res://Objects/start_main.tscn")
	pass # Replace with function body.
