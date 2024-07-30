extends Area2D

signal switch_2

var press_status = false
var block = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name.contains("Fireball"):
		$Sprite2D.frame = 0
		block = false
	if block == false:
		if body.name.contains("Mudball"):
			$Sprite2D.frame = 1
			emit_signal("switch_2")
