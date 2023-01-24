extends Control

@onready var DrawSurface = get_node("%DrawSurface")
@onready var CanvasCamera = $CanvasCamera
@onready var DrawControl = $DrawControl
# Called when the node enters the scene tree for the first time.
func _ready():
	DrawControl.size = $DrawControl/SubViewport.size
	$Container.size = $DrawControl/SubViewport.size

func _process(delta):
	BrushInfo.current_position = DrawControl.get_local_mouse_position()
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
