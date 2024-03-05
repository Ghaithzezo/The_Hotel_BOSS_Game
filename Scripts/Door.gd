extends Area2D

export(PackedScene) var target_scene



export (Color) var blak

func _physics_process(delta):
	$CPUParticles2D2.color = blak
	$CPUParticles2D.color = blak
func _on_Door_body_entered(body):
	if body.is_in_group("player"):
		get_tree().change_scene("res://Objects/Hint_iec.tscn")
		#get_tree().change_scene("res://level/level" + str(int(get_tree().current_scene.name)+1)+".tscn")
	#pass
