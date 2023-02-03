extends Control


func _draw():
#	draw_circle(BrushInfo.click_position,BrushInfo.size,BrushInfo.current_color)
	if not BrushInfo.can_paint:
		return
	match BrushInfo.current_tool:
		BrushInfo.ToolEnum.LINE:
			draw_line(BrushInfo.click_position,BrushInfo.current_position,BrushInfo.current_color,BrushInfo.size)
		_:
			pass
	

func _process(delta):
	queue_redraw()
