extends Path2D
@onready var shark_animation = $PathFollow2D/Shark/AnimationPlayer
signal dead_shark

var SPEED = 100
var dead = false


func _physics_process(delta):
	if dead == false:
		$PathFollow2D.progress += SPEED*delta
		if round(rad_to_deg($PathFollow2D.rotation)) == 90:
			shark_animation.play("move_v_down")
		elif round(rad_to_deg($PathFollow2D.rotation)) == 0:
			shark_animation.play("move_h_right")
		elif round(rad_to_deg($PathFollow2D.rotation)) == -90:
			shark_animation.play("move_v_up")
		elif round(rad_to_deg($PathFollow2D.rotation)) == 180:
			shark_animation.play("move_h_left")
	elif dead == true:
		shark_animation.play("dead")

func _on_area_2d_body_entered(body):
	if body.name.contains("Lightning"):
		if dead == false:
			dead = true
			emit_signal("dead_shark")
		

