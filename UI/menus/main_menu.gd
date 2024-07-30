extends Node2D
@onready var animation_player: AnimationPlayer = %AnimationPlayer
func _ready() -> void:
	animation_player.play("start_animation")


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://rooms/room_1.tscn")
