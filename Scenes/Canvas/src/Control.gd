extends Control

signal zoom_changed(value)
@export var primary_color = Color.BLACK
@export var secondary_color = Color.WHITE
@export var current_tool = BrushInfo.ToolEnum.PEN
@export var canvas_size = Vector2(20,20)
@onready var DrawSurface = get_node("%DrawSurface")
@onready var CanvasCamera = $CanvasCamera
@onready var DrawControl = $DrawControl
# Called when the node enters the scene tree for the first time.
func _ready():
	BrushInfo.primary_color = primary_color
	BrushInfo.secondary_color = secondary_color 
	DrawSurface.size = canvas_size
	BrushInfo.current_tool = current_tool
	DrawControl.size = canvas_size+Vector2.ONE
	$Container.size = canvas_size
	$DrawControl/MainDrawView.size = canvas_size
	

func _input(event):
	
	if event is InputEventMouseButton and event.is_pressed():
		match event.button_index:
			MOUSE_BUTTON_WHEEL_UP:
				CanvasCamera.zoom *= Vector2(1.5,1.5)
				emit_signal("zoom_changed",CanvasCamera.zoom)
				Global.canvas_zoom = CanvasCamera.zoom
			MOUSE_BUTTON_WHEEL_DOWN:
				CanvasCamera.zoom /= Vector2(1.5,1.5)
				emit_signal("zoom_changed",CanvasCamera.zoom)
				Global.canvas_zoom = CanvasCamera.zoom
	if not event is InputEventMouseMotion:
		return
	if Input.is_action_pressed("mouseMiddle_3rd"):
		CanvasCamera.position -= event.relative/CanvasCamera.zoom

func update_zoom(value):
	CanvasCamera.zoom = value
