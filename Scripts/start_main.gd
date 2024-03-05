extends Node2D


func _ready():
	$AudioStreamPlayer2D.play()

func _on_Reload_body_entered(body):
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_About_Developer_body_entered(body):
	get_tree().change_scene("res://Objects/About_Developer.tscn")
	pass # Replace with function body.


func _on_start_body_entered(body):
	get_tree().change_scene("res://level/level.tscn")
	#print(na)
	pass # Replace with function body.


func _on_Quit_body_entered(body):
	get_tree().quit()
	pass # Replace with function body.
