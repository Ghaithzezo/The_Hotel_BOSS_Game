extends Node2D



func _on_Timer2_timeout():
	$AnimationPlayer.play("New Anim")
	$Timer.start()
	$"1".play()
	$"2".play()
	pass # Replace with function body.

func _on_Timer_timeout():
	get_tree().change_scene("res://Objects/start_main.tscn")
	pass # Replace with function body.


