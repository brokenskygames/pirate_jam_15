extends CharacterBody2D


var SPEED = 500


func start(direction,_position):
	position.x = _position.x + _position.normalized().x*direction.normalized().x*50
	position.y = _position.y + _position.normalized().y*direction.normalized().y*150
	velocity = direction * SPEED
	get_node("AnimationPlayer").play("mudball")	

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		get_node("AnimationPlayer").play("impact")
		await get_node("AnimationPlayer").animation_finished
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
