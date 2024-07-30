extends CanvasLayer
class_name MixMenu

signal mix_menu_opened
signal mix_menu_closed

var vial_focus:= 0
var is_menu_open:= false

var mix1: int
var mix2: int
var result: int

@onready var player = get_tree().get_first_node_in_group("player")

@onready var vial_display_1: TextureRect = %VialDisplay1
@onready var vial_display_2: TextureRect = %VialDisplay2

const RED_VIAL = preload("res://assets/art/items/red_vial.png")
const BLUE_VIAL = preload("res://assets/art/items/blue_vial.png")
const GREEN_VIAL = preload("res://assets/art/items/green_vial.png")
const BROWN_VIAL = preload("res://assets/art/items/brown_vial.png")

const PURPLE_VIAL = preload("res://assets/art/items/purple_vial.png")

func _ready() -> void:
	player.connect("changed_vial", _on_changed_vial)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("open_mix_menu"):
		toggle_mix_menu_visibility()
	if visible:
		if event.is_action_pressed("use_vial"):
			shift_vial_display()

func shift_vial_display():
	vial_focus += 1
	if vial_focus == 2:
		if mix1 == mix2:
			toggle_mix_menu_visibility()
		else:
			result = mix1 + mix2
			new_element_select(result)
			toggle_mix_menu_visibility()

func new_element_select(value: int) -> void:
	match value:
		7: #Fireball 6Wind + 1Fire
			player.equip_item = 5
		9: #Lightining 8Earth + 1Fire
			player.equip_item = 8
		10: #Lightining 6wind + 4Water
			player.equip_item = 6
		12: #Mudball 4Water + 8Earth
			player.equip_item = 7
		
		_:#default
			print("invalid combination")
		

func toggle_mix_menu_visibility():
	visible =!visible
	
	if visible:
		is_menu_open = true
		mix_menu_opened.emit()
		clear_menu()
	else:
		is_menu_open = false
		mix_menu_closed.emit()

func clear_menu():
	vial_display_1.texture = null
	vial_display_2.texture = null
	vial_focus = 0
	mix1 = 0
	mix2 = 0
	result = 0

func update_vial_display(value: int, display: TextureRect):
	match value:
		1:
			display.texture = RED_VIAL
		4: 
			display.texture = BLUE_VIAL
		6: 
			display.texture = GREEN_VIAL
		8: 
			display.texture = BROWN_VIAL

func _on_changed_vial(value: int) -> void:
	if is_menu_open:
		match vial_focus:
			0:
				update_vial_display(value, vial_display_1)
				mix1 = value
			1:
				update_vial_display(value, vial_display_2)
				mix2 = value
