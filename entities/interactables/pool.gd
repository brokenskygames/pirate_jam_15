extends Area2D

var fill_status = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
	
#body.name.contains("bullet")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	


func _on_body_entered(body):
	print("hola")
	if body.name.contains("Water"):
		if fill_status < 2:
			fill_status += 1
			$Sprite2D.frame = fill_status
