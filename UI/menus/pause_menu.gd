extends CanvasLayer


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_pause_menu"):
		toggle_pause_menu_visibility()

func toggle_pause_menu_visibility():
	visible =!visible
	if visible:
		get_tree().paused = true
	else:
		get_tree().paused = false

func _on_resume_button_pressed() -> void:
	toggle_pause_menu_visibility()

func _on_restart_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_options_button_pressed() -> void:
	pass # Open options Menu

func _on_exit_button_pressed() -> void:
	get_tree().quit()

