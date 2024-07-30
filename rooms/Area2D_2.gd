extends Area2D


var opening = false
# Called when the node enters the scene tree for the first time.


func _on_pool_3_door_opened():
	opening = true


func _on_body_entered(body):
	if opening == true:
		get_tree().change_scene_to_file("res://rooms/room_3.tscn")



