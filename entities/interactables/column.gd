extends CharacterBody2D


func _ready():
	pass 


func _process(delta):
	velocity = velocity.normalized() * floor(abs(velocity)/(1.1))
	move_and_slide()


func hit(_impact_velocity):
	velocity = _impact_velocity*2
