extends CanvasLayer

@onready var vial_panel_5: Panel = %VialPanel5

@onready var frame_1: TextureRect = %Frame1
@onready var frame_2: TextureRect = %Frame2
@onready var frame_3: TextureRect = %Frame3
@onready var frame_4: TextureRect = %Frame4
@onready var frame_5: TextureRect = %Frame5
@onready var frame_6: TextureRect = %Frame6

@onready var player = get_tree().get_first_node_in_group("player")
@onready var mix_menu = get_tree().get_first_node_in_group("mix_menu")

func _ready() -> void:
	hide_shadow_vial()
	player.connect("changed_vial", _on_changed_vial)
	mix_menu.connect("mix_menu_opened", _on_mix_menu_opened)
	mix_menu.connect("mix_menu_closed", _on_mix_menu_closed)
	mix_menu.connect("master_mix_menu", _on_master_mix_menu)

func show_shadow_vial():
	vial_panel_5.show()
	show_frame(frame_5)
	hide_frame(frame_1)
	hide_frame(frame_2)
	hide_frame(frame_3)
	hide_frame(frame_4)
	hide_frame(frame_6)

func hide_shadow_vial():
	vial_panel_5.hide()

func show_frame(frame: TextureRect):
	frame.show()

func hide_frame(frame: TextureRect):
	frame.hide()

func highlight_mix_menu():
	show_frame(frame_6)
	hide_frame(frame_1)
	hide_frame(frame_2)
	hide_frame(frame_3)
	hide_frame(frame_4)
	hide_frame(frame_5)

func _on_changed_vial(value: int) -> void:
	if value > 1:
		value = value / 2
	else:
		value = 1
	match value:
		1:
			show_frame(frame_1)
			hide_frame(frame_2)
			hide_frame(frame_3)
			hide_frame(frame_4)
			hide_frame(frame_5)
			hide_frame(frame_6)
		2:
			show_frame(frame_2)
			hide_frame(frame_1)
			hide_frame(frame_3)
			hide_frame(frame_4)
			hide_frame(frame_5)
			hide_frame(frame_6)
		3:
			show_frame(frame_3)
			hide_frame(frame_1)
			hide_frame(frame_2)
			hide_frame(frame_4)
			hide_frame(frame_5)
			hide_frame(frame_6)
		4:
			show_frame(frame_4)
			hide_frame(frame_1)
			hide_frame(frame_2)
			hide_frame(frame_3)
			hide_frame(frame_5)
			hide_frame(frame_6)
		5:
			show_frame(frame_5)
			hide_frame(frame_1)
			hide_frame(frame_2)
			hide_frame(frame_3)
			hide_frame(frame_4)
			hide_frame(frame_5)
		6:
			show_frame(frame_6)
			hide_frame(frame_1)
			hide_frame(frame_2)
			hide_frame(frame_3)
			hide_frame(frame_4)
			hide_frame(frame_5)

func _on_mix_menu_opened()-> void:
	highlight_mix_menu()

func _on_mix_menu_closed()->void:
	show_frame(frame_6)
	hide_frame(frame_1)
	hide_frame(frame_2)
	hide_frame(frame_3)
	hide_frame(frame_4)
	hide_frame(frame_5)

func _on_master_mix_menu():
	show_shadow_vial()
	
