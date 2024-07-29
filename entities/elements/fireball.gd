extends CharacterBody2D


var SPEED = 500


func start(direction,_position):
	position = _position + _position.normalized()*direction.normalized()*50
	velocity = direction * SPEED
	get_node("AnimationPlayer").play("fireball")	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		get_node("AnimationPlayer").play("explosion")
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit(velocity)
		await get_node("AnimationPlayer").animation_finished
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

