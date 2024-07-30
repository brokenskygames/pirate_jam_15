extends StaticBody2D

#@onready var darkness_mask : CanvasModulate = %DarknessMask
var candle_lit := false
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var light = $DefaultLight


# For testing
#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("use_vial"):
		#light_candle()

func light_candle():
	animation_player.play("lit")
	candle_lit = true
	print(light)
	light.set_enabled(true)
	#darkness_mask.visible = false

func extinguish_candle():
	animation_player.play("unlit")
	candle_lit = false
	light.set_enabled(false)
	#darkness_mask.visible = true


func _on_trigger_area_body_entered(body: Node2D) -> void:
	print("entro")
	if not candle_lit:
		if body.name.contains("Fire"):
			light_candle()
		elif body.is_in_group("lightning"):
			light_candle()
	if candle_lit:
		if body.is_in_group("water"):
			extinguish_candle()
		elif body.is_in_group("air"):
			extinguish_candle()
