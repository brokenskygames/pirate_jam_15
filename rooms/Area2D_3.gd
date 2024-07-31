extends Area2D

var is_safe = false
var opening = false
# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if opening == true:
		if body.name.contains("Player"):
			get_tree().change_scene_to_file("res://rooms/room_4.tscn")


func _on_shark_area_body_entered(body):
	if body.name.contains("Player"):
		if is_safe == false:
			for brick in get_tree().get_nodes_in_group("brick"):
				brick.queue_free()
			get_tree().reload_current_scene()


func _on_path_2d_dead_shark():
	is_safe = true


func _on_leaf_4_door_opened():
	opening = true
