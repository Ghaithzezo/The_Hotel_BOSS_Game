extends KinematicBody2D

signal _on_enemy_smller_body_entered(body)
signal death_boss_Gost 

var velocty = Vector2.ZERO
var speed = 10
var player = null
var vuleo_health = 5
onready var ani_sprite = $AnimatedSprite
onready var R_right = $right
onready var R_left  = $left
onready var kye = $"../Kye_Dark/Timer"

var light =preload("res://Objects/light.tscn")
onready var smell =preload("res://Objects/Small_enemy.tscn")
#func _ready():
	#var player = get_node("res://Objects/Player.tscn")
	#var helth_bar =get_node("res://Objects/haeth_bar.tscn")

func _ready():
	$enemy_smller/CollisionShape2D2.disabled = false
	#$"../Door".vi
	#$summon_Timer.start()
	pass 


func _physics_process(delta):	
	move_and_slide(Vector2(0,0))#.rotated(rotation))


func _on_left_body_entered(body):
	if body.is_in_group("player"):
		$".".scale.x =  -2
	pass # Replace with function body.


func _on_left_body_exited(body):
	if body.is_in_group("player"):
		$".".scale.x = 2
	pass # Replace with function body.


func _on_summon_Timer_timeout():

	pass # Replace with function body.



func _on_zon_area_entered(area):

	#helth_bar.get_parent().queue_free()
	if area.is_in_group("light"):
		$"../health_bar".value -= 2
	
		
		$hit_suond.play()
		if $"../health_bar".value <= 0:
			emit_signal("death_boss_Gost")
			ani_sprite.play("death")
			$"../Death_Timer".start()
			$enemy_smller/CollisionShape2D2.disabled = true
	pass 



func _on_attack_body_entered(body):

	if body.is_in_group("player"):
		$HIt/CollisionShape2D.disabled =  false
		ani_sprite.play("attack")
		$sword.play()
	else:
		ani_sprite.play("Idile")
	pass # Replace with function body.


func _on_attack_body_exited(body):
	if body.is_in_group("player"):
		#ani_sprite.play("Idile")
		$HIt/CollisionShape2D.disabled =  true
	pass # Replace with function body.


func _on_enemy_smller_body_entered(body):
	if body.is_in_group("player"):
		$semon.play()
		$AnimatedSprite.play("summon")
		var enemy = smell.instance()
		enemy.position = Vector2(rand_range(20,40),30)
		add_child(enemy)  
		#emit_signal("enemy")
	else:
		ani_sprite.play("Idile")
		pass # Replace with function body.

func _on_Death_Timer_timeout():
	queue_free()
	pass # Replace with function body.
