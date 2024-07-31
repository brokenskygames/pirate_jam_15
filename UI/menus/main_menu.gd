extends Node2D

@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var controls_button: Button = $UI/Control/ButtonBackgroundPanel/VBoxContainer/ControlsButton
@onready var control_menu: CanvasLayer = %ControlMenu

func _ready() -> void:
	animation_player.play("start_animation")

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://rooms/room_1.tscn")

func _on_controls_button_pressed() -> void:
	control_menu.show()

func _on_button_pressed() -> void:
	control_menu.hide()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
