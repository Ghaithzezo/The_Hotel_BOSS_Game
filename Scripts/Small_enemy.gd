extends KinematicBody2D

var motion = Vector2()
var speed = 50
var gravity = 10

var direction = 1

onready var ani = $AnimatedSprite

func _physics_process(delta):
	$Area2D.visible = true

	motion.y += gravity
	motion.x += speed * direction
	if is_on_wall():
		direction = direction *-1 
	motion = move_and_slide(motion)




func _on_Area2D_area_entered(area):
	if area.is_in_group("attack"):
		ani.play("Death")
		$Area2D.visible = false
		
		$queue_Timer.start()

	pass # Replace with function body.


func _on_queue_Timer_timeout():
	queue_free()
	pass # Replace with function body.
