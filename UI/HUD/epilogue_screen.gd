extends CanvasLayer


func _on_button_pressed():
	get_tree().change_scene_to_file("res://UI/menus/main_menu.tscn")
