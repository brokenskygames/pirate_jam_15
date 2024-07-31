extends Area2D

signal darkness

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scale_factor = 0.4
	$CollisionShape2D.scale.x += scale_factor*delta
	position.x += delta*1.5
	$CollisionShape2D.scale.y += scale_factor*delta
	$Sprite2D.scale.x += scale_factor*delta
	$Sprite2D.scale.y += scale_factor*delta


func _on_body_entered(body):
	if body.name.contains("Candle"):
		emit_signal("darkness")
		body.queue_free()
	if body.name.contains("Player"):
		get_tree().change_scene_to_file("res://UI/HUD/player_death_screen.tscn")





func _on_end_game_timeout():
	get_tree().root.change_scene_to_file("res://UI/menus/main_menu.tscn")
