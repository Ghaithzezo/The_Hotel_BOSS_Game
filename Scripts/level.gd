extends Node2D

func _ready():
	$AudioStreamPlayer2D.play()

func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
		get_tree().change_scene("res://Objects/door_hotel.tscn")
	pass # Replace with function body.
