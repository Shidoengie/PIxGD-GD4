extends SubViewportContainer

signal mouse_moved(prev_mousePos,mousePos)
signal paint(primary)
signal notPainting
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_primary = true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func _process(delta):
	BrushInfo.last_position = BrushInfo.current_position
	BrushInfo.current_position = get_local_mouse_position()

func _gui_input(event):
	
	
	if Input.is_action_just_pressed("mouseLeft_1st") or Input.is_action_just_pressed("mouseRight_2nd"):
		BrushInfo.click_position = get_local_mouse_position()
	if Input.is_action_pressed("mouseLeft_1st"):
		BrushInfo.is_primary = true
	elif Input.is_action_pressed("mouseRight_2nd"):
		BrushInfo.is_primary = false
	else:
		BrushInfo.can_paint = false
		emit_signal("notPainting")
		return
	emit_signal("paint")
	BrushInfo.can_paint = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


