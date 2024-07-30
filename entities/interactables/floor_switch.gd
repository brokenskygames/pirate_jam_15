extends Area2D

signal door_opened

var switch = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.frame = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if switch == false:
		switch = true
		$Sprite2D.frame = 1
		emit_signal("door_opened")
