extends CharacterBody2D


var SPEED = 800


func start(direction,_position):
	position = _position + _position.normalized()*direction.normalized()*100
	velocity = direction * SPEED
	get_node("AnimationPlayer").play("brick")	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()



func _on_area_2d_body_entered(body):
	print(body.name)
	if body.name.contains("Player"):
		body.set_collision_mask_value(7,false)


