extends StaticBody2D


var opening = false
var position_old = 0


func _on_floor_switch_door_opened():
	opening = true
	position_old = position.y
	
		
func _physics_process(delta):
	if opening == true:
		if abs(position.y - position_old) < 50:
			position.y = position.y + delta * 100
			
			


func _on_pool_3_door_opened():
	opening = true
	position_old = position.y
