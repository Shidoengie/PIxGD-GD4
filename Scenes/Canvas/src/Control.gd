extends Control

@export var canvas_size = Vector2(100,100)
@onready var DrawSurface = get_node("%DrawSurface")
@onready var CanvasCamera = $CanvasCamera
@onready var DrawControl = $DrawControl
# Called when the node enters the scene tree for the first time.
func _ready():
	DrawSurface.size = canvas_size
	DrawControl.size = canvas_size
	$Container.size = canvas_size
	$DrawControl/SubViewport.size = canvas_size
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				CanvasCamera.zoom *= Vector2(1.5,1.5)
			MOUSE_BUTTON_WHEEL_DOWN:
				CanvasCamera.zoom /= Vector2(1.5,1.5)
	if not event is InputEventMouseMotion:
		return
	if Input.is_action_pressed("mouseMiddle_3rd"):
		CanvasCamera.position -= event.relative/CanvasCamera.zoom
