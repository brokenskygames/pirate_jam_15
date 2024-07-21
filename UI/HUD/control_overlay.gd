extends CanvasLayer

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("control_overlay"):
		toggle_control_overlay_visibility()

func toggle_control_overlay_visibility():
	visible = !visible
