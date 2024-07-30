extends CharacterBody2D


var SPEED = 350

func start(direction,_position):
	position.x = _position.x + _position.normalized().x*direction.normalized().x*50
	position.y = _position.y + _position.normalized().y*direction.normalized().y*100
	velocity = direction * SPEED
	get_node("AnimationPlayer").play("earth")	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)

	if collision:
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit(velocity)
		get_node("AnimationPlayer").play("earth_impact")
		await get_node("AnimationPlayer").animation_finished
		queue_free()
	await get_node("AnimationPlayer").animation_finished
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
