extends Control

var secondary_color = Color.WHITE
var primary_color = Color.BLACK
var current_color = Color.BLACK

var brush_size = 10

var canPaint = false
var is_primary = true
var last_position = Vector2.ZERO
var current_position = Vector2.ZERO
func _draw():
	if canPaint:
		draw_circle(current_position,10,current_color)
	
func _process(delta):
	current_color = primary_color if is_primary else secondary_color
	print(is_primary)
	queue_redraw()
	
func _on_DrawControl_paint():
	canPaint = true

func _on_DrawControl_notPainting():
	canPaint = false
	
func _on_draw_control_mouse_moved(prev_mousePos, mousePos):
	last_position = prev_mousePos
	current_position = mousePos
