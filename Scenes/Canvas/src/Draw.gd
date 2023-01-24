extends Control

var canPaint = false

func _draw():
	if canPaint:
		draw_circle(BrushInfo.current_position,10,Color.BLACK)
	
func _process(delta):
	queue_redraw()
	


func _on_DrawControl_paint():
	canPaint = true

func _on_DrawControl_notPainting():
	canPaint = false
