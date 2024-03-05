extends Node2D

func _ready():
	$door.visible = false
	$kye.visible = false
	$kye/CollisionShape2D.disabled = true
	$door.monitoring = false

func _on_Enemy_ice_death():
	$kye.visible = true
	$kye/CollisionShape2D.disabled = false
	pass # Replace with function body.


func _on_kye_body_entered(body):
	if body.is_in_group("player"):
		$kye_sound.play()
		$kye.visible = false
		$door.visible = true
		$door.monitoring = true
	pass # Replace with function body.


func _on_door_body_entered(body):
	if body.is_in_group("player"):
		
		get_tree().change_scene("res://Objects/hint_fier.tscn")
		queue_free()      
		#get_tree().change_scene("res://Objects/hint_fier.tscn")
	pass # Replace with function body.
