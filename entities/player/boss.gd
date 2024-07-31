extends Area2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scale_factor = 0.8
	$CollisionShape2D.scale.x += scale_factor*delta
	position.x += delta*2
	$CollisionShape2D.scale.y += scale_factor*delta
	$Sprite2D.scale.x += scale_factor*delta
	$Sprite2D.scale.y += scale_factor*delta


func _on_body_entered(body):
	print(body.name)
	if body.name.contains("Candle"):
		body.queue_free()
	if body.name.contains("Player"):
		print("kill")



