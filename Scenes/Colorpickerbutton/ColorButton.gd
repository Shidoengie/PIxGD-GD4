class_name SliderColorButton
extends Control

@export var color = Color.WHITE
@onready var color_panel = %ColorPanel
@onready var hex_color = $HexColor

# Called when the node enters the scene tree for the first time.
func _ready():
	hex_color.text = "#"+str(color.to_html())
	color_panel.color = color

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print_debug("aa")
