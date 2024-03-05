extends Control


signal Low()

const flash = 0.05
const N_flashes = 4

onready var helth_over  = $healthOver
onready var health_under = $healthunder
onready var update_Tween = $update_Tween
onready var Low_Tween = $Low_Tween
onready var flash_Tween =$flash_Tween

export (Color) var flash_color= Color.orange
export (Color) var low_color = Color.darkred
export (Color) var healthy_color  = Color.green
export (Color) var caution_color  = Color.yellow
export (Color) var danger_color  = Color.red
export (float, 0, 1, 0.5) var caution_zone = 0.5
export (float, 0, 1, 0.5) var danger_zone = 0.2
export (bool ) var  will_low = false



func _on_health_updated(health, amount):
	helth_over. value = health
	
	update_Tween.interpolate_property(health_under, "value", health_under.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
	update_Tween.start()
	
	_assing_color(health)
	if amount < 0:
		_flash_damage()
func _assing_color(health):
	if health == 0:
		Low_Tween.set_active(false)
	if health < helth_over.max_value * danger_zone:
		if will_low :
			if !Low_Tween.is_active():
				Low_Tween.interpolate_property(helth_over, "tint_progress", low_color, danger_color, 1.2, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
				Low_Tween.start()
				Low_Tween.interpolate_callback(self, 0.0, "emit_signal", "Low")
		else:
			helth_over.tint_progress = danger_color
	else:
		Low_Tween.set_active(false)
		if health < helth_over.max_value * caution_color: 
			helth_over.tint_progress = caution_color
		else:
			helth_over.tint_progress = healthy_color

func _flash_damage():
	for i in range(N_flashes * 2 ):
		var color = helth_over.tint_progress if  i % 2 == 1 else flash_color
		var timer = flash * i + flash
		flash_Tween.interpolate_callback(helth_over, timer, "set","tint_progress", color)
	flash_Tween.start()
func _on_max_health_update(max_health):
	helth_over.max_value = max_health
	health_under.max_value = max_health
