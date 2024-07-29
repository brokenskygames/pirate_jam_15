extends CharacterBody2D


func _ready():
	pass 


func _process(delta):
	velocity = velocity.normalized() * floor(abs(velocity)/(1.2))
	move_and_slide()


func hit(_impact_velocity):
	print(_impact_velocity)
	print("hit")
	velocity = _impact_velocity
