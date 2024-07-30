extends Area2D

var floating = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if floating == true:
		position.y -= delta*500


func _on_body_entered(body):
	if body.name.contains("Wind"):
		floating = true
		$life.start(0.5)


func _on_life_timeout():
	queue_free()
