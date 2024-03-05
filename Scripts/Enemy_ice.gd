extends KinematicBody2D

signal damig 
signal death

const bullet_scene = preload("res://Objects/warer.tscn")
const player = preload("res://Objects/Player.tscn")

onready var shoot_timer = $shoot_timer
onready var rotater = $Rotater


const rotate_speed = 80
const shoot_timer_wait_time = 0.2
const spawn_point_count = 3
const radius = 100 

var gravity = 10 
var velocity = Vector2()
var speed = 1
var dir = -1


func warer():
	var step = 2 * PI / spawn_point_count
	
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 7).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		$bullet.play()
	
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()

#func _process(delta):
	#var new_rotation = rotater.rotation_degrees + rotate_speed * delta
	#rotater.rotation_degrees = fmod(new_rotation, 360)

func _on_shoot_timer_timeout():
	for s in rotater.get_children():
		var bullet = bullet_scene.instance()
		get_tree().root.add_child(bullet)
		bullet.position = s.global_position
		bullet.rotation = s.global_rotation	
		pass # Replace with function body.



func _physics_process(delta):
	velocity.y += gravity 
	velocity.x += speed * dir
	#$attack/AnimationPlayer.play("walk")
	

	if $RayCast2D.is_colliding():
		dir *= -1 
		scale.x = -scale.x
	velocity = move_and_slide(velocity)


func _on_player_detcotor_body_entered(body):
	if body.is_in_group("player"):
		$attack/AnimationPlayer.play("attack")
		$hit_box.play()
		$"../Gas2/AnimatedSprite2".playing = true
		
	else:
		$"../Gas2/AnimatedSprite2".playing = false
		$"attack/AnimationPlayer".play("walk")
	pass


func _on_fier_area_entered(area):
	if area.is_in_group("attack"):
		$"../fier2".play()
		$"../Gas2".play("gas")
		$"../Gas2/Gas3".monitoring = true
		$"../Gas5".play("gas")
		$"../Gas2/Gas4".monitoring = true
		$"../fibesh_gas".start()
	else:
		$attack/AnimationPlayer.play("walk")
	pass # Replace with function body.

func _on_fibesh_gas_timeout():
	
	$"../Gas2/Gas3".monitoring = false
	$"../Gas2".playing = false
	$"../Gas2/Gas4".monitoring = false
	$"../Gas5".playing = false
	pass # Replace with function body.


func _on_Gas3_area_entered(area):
	if area.is_in_group("body_ice"):
		$"../TextureProgress2".value -= 5                           
		$"attack/AnimationPlayer".play("Hit")
	else:
		$"attack/AnimationPlayer".play("walk")
	if $"../TextureProgress2".value <= 0:
		$attack/AnimationPlayer.play("Deth")
		velocity.x == 0
		$Deth.start()
		
	pass

func _on_Deth_timeout():
	queue_free()
	emit_signal("death")
	pass # Replace with function body.


func _on_Timer_timeout():
	pass # Replace with function body.
	
	
	


func _on_icebox_body_entered(body):
	if body.is_in_group("player"):
		$"../Gas2/icebox".playing = true
	pass
func _on_icebox_body_exited(body):
	if body.is_in_group("player"):
		$"../Gas2/icebox".playing = false
	pass


func _on_Water_timeout():
	$finsh_water.start()
	$attack/AnimationPlayer.play("warer")
	velocity =Vector2(0,0)
	warer()
	pass # Replace with function body.


func _on_finsh_water_timeout():
	shoot_timer.stop()
	pass # Replace with function body.
