extends CharacterBody2D


var SPEED = 800


func start(direction,_position):
	position.x = _position.x + _position.normalized().x*direction.normalized().x*50
	position.y = _position.y + _position.normalized().y*direction.normalized().y*100
	velocity = direction * SPEED
	get_node("AnimationPlayer").play("brick")	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_area_2d_body_entered(body):
	if body.name.contains("Player"):
		body.set_collision_mask_value(7,false)




func _on_timer_timeout():
	queue_free()
