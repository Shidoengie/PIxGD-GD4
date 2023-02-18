extends Control

var canPaint = false
var current_color : Color
func _draw():
	
	match Tools.current:
		Tools.PEN:
			_paint(current_color)
		Tools.ERASOR:
			_paint(Color.TRANSPARENT)
		Tools.LINE:
#			if Input.is_action_just_released("mouseLeft_1st") or Input.is_action_just_released("mouseRight_2nd"):
				draw_line(BrushInfo.click_position,BrushInfo.current_position,current_color,BrushInfo.size)
		_:
			pass
func _paint(color):
	if not canPaint:
		return
	if BrushInfo.size == 1:
		var single_pixel_rect = Rect2(Vector2i(BrushInfo.current_position),Vector2(BrushInfo.size,BrushInfo.size))
		draw_rect(single_pixel_rect,color)
		return
	draw_circle(BrushInfo.current_position,BrushInfo.size,color)

func _process(delta):
	current_color = BrushInfo.primary_color if BrushInfo.is_primary else BrushInfo.secondary_color
	BrushInfo.current_color = current_color
	queue_redraw()
	


func _on_DrawControl_paint():
	canPaint = true

func _on_draw_control_not_painting():
	canPaint = false
