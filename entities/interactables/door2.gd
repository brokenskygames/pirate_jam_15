extends StaticBody2D


var opening = false
var position_old = 0



func _physics_process(delta):
	if opening == true:
		if abs(position.x - position_old) < 50:
			position.y = position.x + delta * 100
			
			


func _on_leaf_4_door_opened():
	opening = true
	position_old = position.x
