extends CanvasLayer
class_name MixMenu
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_mix_menu"):
		toggle_mix_menu_visibility()

func toggle_mix_menu_visibility():
	visible =!visible
