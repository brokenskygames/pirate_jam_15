extends CanvasLayer

var open = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mix_menu_master_mix_menu():
	visible =!visible
	open = true
	
func _unhandled_key_input(event):
	if open == true:
		if event.is_pressed():
			visible =!visible
			open = false
