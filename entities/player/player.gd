extends CharacterBody2D


@onready var sprite : Sprite2D = $Sprite2D
@onready var animation_tree : AnimationTree = sprite.get_node("AnimationTree")


var earth = preload("res://entities/elements/earth.tscn")
var fire = preload("res://entities/elements/fire.tscn")
var water = preload("res://entities/elements/water.tscn")
var wind = preload("res://entities/elements/wind.tscn")

var fireball = preload("res://entities/elements/fireball.tscn")
var lightning = preload("res://entities/elements/lightning.tscn")
var mudball = preload("res://entities/elements/mudball.tscn")


const SPEED = 400.0
var direction : Vector2 = Vector2.ZERO
var dir_facing : Vector2 = Vector2.ZERO
var equip_item = 0



func _ready():
	# initial animation state
	animation_tree["parameters/conditions/is_idle"] = true
	animation_tree["parameters/conditions/is_moving"] = false
	animation_tree["parameters/idle/blend_position"] = 	[1,0]
	dir_facing = Vector2 (1,0 )


func _physics_process(_delta):

	get_input()
	update_animation_status()

	move_and_slide()

func get_input():
	#basic movement
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction != Vector2.ZERO:
		dir_facing = direction
	velocity = direction * SPEED
	
	if Input.is_action_just_pressed("use_vial"):
		print("shoot")
		use_vial()

func use_vial():
	equip_item = 7
	if equip_item == 1:
		var fire_vial = fire.instantiate()
		fire_vial.start(dir_facing,global_position)
		get_tree().root.add_child(fire_vial)
	if equip_item == 2:
		var water_vial = water.instantiate()
		water_vial.start(dir_facing,global_position)
		get_tree().root.add_child(water_vial)
	if equip_item == 3:
		var wind_vial = wind.instantiate()
		wind_vial.start(dir_facing,global_position)
		get_tree().root.add_child(wind_vial)
	if equip_item == 4:
		var earth_vial = earth.instantiate()
		earth_vial.start(dir_facing,global_position)
		get_tree().root.add_child(earth_vial)
	
	#MIX Elements
	if equip_item == 5:
		var fireball_vial = fireball.instantiate()
		fireball_vial.start(dir_facing,global_position)
		get_tree().root.add_child(fireball_vial)
	if equip_item == 6:
		var lightning_vial = lightning.instantiate()
		lightning_vial.start(dir_facing,global_position)
		get_tree().root.add_child(lightning_vial)
	if equip_item == 7:
		var mudball_vial = mudball.instantiate()
		mudball_vial.start(dir_facing,global_position)
		get_tree().root.add_child(mudball_vial)



func update_animation_status():
	# updating the animation tree state
	if(velocity == Vector2.ZERO):
		animation_tree["parameters/conditions/is_idle"] = true
		animation_tree["parameters/conditions/is_moving"] = false
	else:
		animation_tree["parameters/conditions/is_idle"] = false
		animation_tree["parameters/conditions/is_moving"] = true
	if(direction != Vector2.ZERO):
		animation_tree["parameters/idle/blend_position"] = 	direction
		animation_tree["parameters/move/blend_position"] = 	direction
	
	
