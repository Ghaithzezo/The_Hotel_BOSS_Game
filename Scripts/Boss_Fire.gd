extends KinematicBody2D

signal damig 

const bullet_scene = preload("res://Objects/Bullet.tscn")
const player = preload("res://Objects/Player.tscn")

onready var shoot_timer = $shoot_timer
onready var rotater = $Rotater


const rotate_speed = 50
const shoot_timer_wait_time = 0.2
const spawn_point_count = 6
const radius = 50

var gravity = 10 
var velocity = Vector2()
var ve = Vector2(0,0)
var speed = 1
var dir = -1


func Bullet():
	var step = 2 * PI / spawn_point_count
	
	for i in range(spawn_point_count):
		var spawn_point = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn_point.position = pos
		spawn_point.rotation = pos.angle()
		rotater.add_child(spawn_point)
		$buller.play()
	
	shoot_timer.wait_time = shoot_timer_wait_time
	shoot_timer.start()


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
		$AnimationPlayer.play("attack")
		$sowrd.play()
	else:
		$AnimationPlayer.play("idle")
	pass # Replace with function body.




func _on_Timer_timeout():
	shoot_timer.stop()
	#velocity.x += speed * dir
	pass # Replace with function body.


func _on_firt_timeout():
	$AnimationPlayer.play("New Anim")
	$Timer.start()
	velocity = Vector2(0,0)
	Bullet()
	pass


func _on_red_Area2D_area_entered(area):
	if area.is_in_group("attack"):
		$"../AnimationPlayer".play("red")
		$"../AnimationPlayer2".play("wwth")
		$"../fier_srart".start()
	pass # Replace with function body.


func _on_fier_srart_timeout():
	$"../AnimationPlayer".stop(false)
	$"../AnimationPlayer2".stop(true)
	pass # Replace with functioa

func _on_34_area_entered(area):
	if area.is_in_group("body_fire"):
		$"../Control/TextureProgress".value -= 10
		$AnimationPlayer.play("walk")
	if $"../Control/TextureProgress".value <= 0 :
		$AnimationPlayer.play("demon")
		velocity = Vector2(0,0)
		$dragh.start()
	pass # Replace with function body.


func _on_dragh_timeout():
	queue_free()
	get_tree().change_scene("res://Objects/The_End.tscn")
	pass # Replace with function body.


func _on_ee_area_entered(area):
	if area.is_in_group("attack"):
		$"../AnimationPlayer3".play("red")
		$"../AnimationPlayer2/reght".play("wwth")
		$"../fier_srart".start()
	pass # Replace with function body.


func _on_Hit_body_entered(body):
	if body.is_in_group("player"):
		$hiiitt.play()
	pass # Replace with function body.
