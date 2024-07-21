extends CharacterBody2D


@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = sprite.get_node("AnimationTree")


const SPEED = 450.0
var direction : Vector2 = Vector2.ZERO

func _ready():
	animation_tree["parameters/conditions/is_idle"] = true
	animation_tree["parameters/conditions/is_moving"] = false
	animation_tree["parameters/idle/blend_position"] = 	[1,0]


func _physics_process(_delta):


	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
	
	update_animation_status()

	move_and_slide()


func update_animation_status():

	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
	if(direction != Vector2.ZERO):
		animation_tree["parameters/idle/blend_position"] = 	direction
		animation_tree["parameters/move/blend_position"] = 	direction
	
	
