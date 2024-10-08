extends CharacterBody2D


var SPEED = 400


func start(direction,_position):
	position = _position + _position.normalized()*direction.normalized()*50
	velocity = direction * SPEED

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit(velocity)
		queue_free()
	get_node("AnimationPlayer").play("wind")
	await get_node("AnimationPlayer").animation_finished
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
