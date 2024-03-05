extends Area2D

signal Key_taken



var door = preload("res://Objects/Door.tscn")

func _ready():
	$".".visible = false
	$CollisionShape2D.disabled = false
	pass
func _on_Kye_Dark_body_entered(body):
	if body.is_in_group("player"):
		var DOOR = door.instance()
		DOOR.position = Vector2(5,60)
		add_child(DOOR)
		$Sprite.visible = false
		$Light2D.visible = false
		$Label.visible = false
	pass # Replace with function body.

func _on_dark_enemy_death_boss_Gost():
	$Timer.start()
	pass 

func _on_Timer_timeout():
	$".".visible = true
	$CollisionShape2D.disabled = false
	pass # Replace with function body.
