extends StaticBody2D

#@onready var darkness_mask : CanvasModulate = %DarknessMask
var candle_lit := false
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var light = $DefaultLight

signal darkness

# For testing
#func _unhandled_input(event: InputEvent) -> void:
	#if event.is_action_pressed("use_vial"):
		#light_candle()
func _ready():
	light.set_enabled(true)
	candle_lit=true
	animation_player.play("lit")


func extinguish_candle():
	animation_player.play("unlit")
	candle_lit = false
	light.set_enabled(false)
	emit_signal("darkness")
	#darkness_mask.visible = true


func _on_trigger_area_body_entered(body: Node2D) -> void:

	if candle_lit:
		if body.name.contains("Water"):
			extinguish_candle()
		elif body.name.contains("Wind"):
			extinguish_candle()
