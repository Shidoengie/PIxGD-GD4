extends Control
signal mouse_moved(prev_mousePos,mousePos)
signal paint()
signal notPainting
signal zoom_changed(value)
signal change_brush
@export var primary_color = Color.BLACK
@export var secondary_color = Color.WHITE
@export var current_tool = Tools.PEN
@export var canvas_size = Vector2(20,20)
@onready var DrawSurface = get_node("%DrawSurface")
@onready var CanvasCamera = $CanvasCamera
#@onready var DrawControl = $DrawControl
# Called when the node enters the scene tree for the first time.
#func _ready():
#	BrushInfo.primary_color = primary_color
#	BrushInfo.secondary_color = secondary_color 
#	DrawSurface.size = canvas_size
#	Tools.current = current_tool
#	DrawControl.size = canvas_size+Vector2.ONE
	
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

func _gui_input(event):
	if event is InputEventMouseMotion:
		BrushInfo.last_position = BrushInfo.current_position
		BrushInfo.current_position = DrawSurface.get_local_mouse_position()
	if Input.is_action_just_pressed("mouseLeft_1st") or Input.is_action_just_pressed("mouseRight_2nd"):
		BrushInfo.click_position = get_local_mouse_position()
	if Input.is_action_pressed("mouseLeft_1st"):
		BrushInfo.is_primary = true
	elif Input.is_action_pressed("mouseRight_2nd"):
		BrushInfo.is_primary = false
	else:
		BrushInfo.can_paint = false
		return
	BrushInfo.can_paint = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
