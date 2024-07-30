extends CanvasLayer
@export var mix_menu : MixMenu
@onready var vial_panel_5: Panel = %VialPanel5

func _ready() -> void:
	hide_shadow_vial()

func show_shadow_vial():
	vial_panel_5.show()

func hide_shadow_vial():
	vial_panel_5.hide()
