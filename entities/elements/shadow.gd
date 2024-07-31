extends CharacterBody2D



var SPEED = 400
var win = false

func start(direction,_position):
	position.x = _position.x + _position.normalized().x*direction.normalized().x*50
	position.y = _position.y + _position.normalized().y*direction.normalized().y*100
	velocity = direction * SPEED
	get_node("AnimationPlayer").play("shadow")

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if win == false and collision:
		queue_free()
	if win == true:
		$Sprite2D2.scale.x += 5*delta
		$Sprite2D2.scale.y += 5*delta
		



func _on_area_2d_area_entered(area):
	if area.name.contains("Boss"):
		win = true
		$end_game.start(10)
	


func _on_end_game_timeout():
	get_tree().change_scene_to_file("res://UI/menus/main_menu.tscn")


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
