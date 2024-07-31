extends StaticBody2D


var opening1 = false
var opening2 = false
var position_old = 0



func _physics_process(delta):
	if opening1 == true and opening2 == true:
		if abs(position.x - position_old) < 50:
			position.y = position.x + delta * 100
			
			

func _on_switch_switch_1():
	opening1 = true # Replace with function body.
	position_old = position.x


func _on_switch_2_switch_2():
	opening2 = true # Replace with function body.
	position_old = position.x
