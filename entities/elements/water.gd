extends CharacterBody2D


var position_old
var SPEED = 150

func start(direction,_position):
	position.x = _position.x + _position.normalized().x*direction.normalized().x*150
	position.y = _position.y + _position.normalized().y*direction.normalized().y*150 - 150
	velocity.x = 0
	velocity.y = SPEED 



func _physics_process(delta):
	move_and_slide()
	get_node("AnimationPlayer").play("water")
	await get_node("AnimationPlayer").animation_finished
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
