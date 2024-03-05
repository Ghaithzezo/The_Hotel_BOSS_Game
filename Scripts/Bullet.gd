extends Area2D

const speed = 100

func _process(delta):
	position += transform.x * speed * delta 
	



func _on_Bullet_body_entered(body):
	if body.is_in_group("player"):
		queue_free()
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.
