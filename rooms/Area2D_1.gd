extends Area2D

var opening = false
# Called when the node enters the scene tree for the first time.

func _on_floor_switch_door_opened():
	opening = true
	


func _on_body_entered(body):
	print("entro")
	if opening == true:
		get_tree().change_scene_to_file("res://rooms/room_2.tscn")
