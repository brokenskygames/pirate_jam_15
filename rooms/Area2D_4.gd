extends Area2D
var opening1 = false
var opening2 = false
# Called when the node enters the scene tree for the first time.

func _on_body_entered(body):
	if opening1 == true and opening2 == true:
		if body.name.contains("Player"):
			get_tree().change_scene_to_file("res://rooms/room_end.tscn")




func _on_switch_switch_1():
	opening1 = true # Replace with function body.


func _on_switch_2_switch_2():
	opening2 = true # Replace with function body.
