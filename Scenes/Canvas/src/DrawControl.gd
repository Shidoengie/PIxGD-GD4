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
	pass

func _gui_input(event):
	
	BrushInfo.last_position = get_local_mouse_position()
	
	if Input.is_action_pressed("mouseLeft_1st"):
		is_primary = true
	elif Input.is_action_pressed("mouseRight_2nd"):
		is_primary = false
	else:
		emit_signal("notPainting")
		return
	BrushInfo.current_position = get_local_mouse_position()
	emit_signal("paint")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DrawControl_mouse_moved(prev_mousePos, mousePos):
	
	pass # Replace with function body.
