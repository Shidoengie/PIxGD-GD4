extends SubViewportContainer

signal mouse_moved(prev_mousePos,mousePos)
signal paint
signal notPainting
var last_position = Vector2.ZERO
var current_position = Vector2.ZERO
@onready var DrawSurface = get_node("%DrawSurface") 
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _gui_input(event):
	
	last_position = current_position
	current_position = get_local_mouse_position()
	
	if event is InputEventMouseMotion:
		emit_signal("mouse_moved",last_position,current_position)
	if Input.is_action_pressed("mouseLeft_1st"):
		DrawSurface.is_primary = true
	elif Input.is_action_pressed("mouseRight_2nd"):
		DrawSurface.is_primary = false
	else:
		emit_signal("notPainting")
		return
	emit_signal("paint")
	
