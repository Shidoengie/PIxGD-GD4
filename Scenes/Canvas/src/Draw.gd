extends Control

var canPaint = false
var current_color : Color
func _draw():
	
	if not canPaint:
		return
	match BrushInfo.current_tool:
		BrushInfo.ToolEnum.PEN:
			draw_circle(BrushInfo.current_position,BrushInfo.size,current_color)
		_:
			pass
	
	
func _process(delta):
	current_color = BrushInfo.primary_color if BrushInfo.is_primary else BrushInfo.secondary_color
	queue_redraw()
	


func _on_DrawControl_paint():
	canPaint = true

func _on_DrawControl_notPainting():
	canPaint = false
