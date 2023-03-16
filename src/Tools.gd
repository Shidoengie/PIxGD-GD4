extends Node

enum {PEN,LINE,ERASOR,FILL}
var current = FILL
func blit_brush(position:Vector2i,size:int,color:Color,brush_image:Image,canvas):
	if BrushInfo.last_position != position:
		blit_line(BrushInfo.last_position,position,color,size,brush_image,canvas)
	_placeBrush(color,position,brush_image,canvas)
	
func blit_line(start:Vector2,end:Vector2,color:Color,width:int,shape:Image,canvas):
	var offset = Vector2i(shape.get_used_rect().get_center())
	var x0 = start.x
	var y0 = start.y
	var x1 = end.x
	var y1 = end.y
	var dx = abs(x1 - x0)
	var sx = 1 if x0 < x1 else -1
	var dy = -abs(y1 - y0)
	var sy = 1 if y0 < y1 else -1
	var error = dx + dy
	
	while true:
		_placeBrush(color,Vector2i(x0,y0),shape,canvas)
		if x0 == x1 and y0 == y1:
			break
		var e2 = 2 * error
		if e2 >= dy:
			if x0 == x1:
				break
			error += dy
			x0 += sx
		if e2 <= dx:
			if y0 == y1:
				break
			error += dx
			y0 += sy
# https://en.wikipedia.org/wiki/Bresenham%27s_line_algorithm
func floodfill(canvas_image:Image,x:int,y:int,color:Color):
	var w = canvas_image.get_height()
	var h = canvas_image.get_width()
	var old_color = canvas_image.get_pixel(x,y)
	if color == old_color:
		return
	var queue = []
	queue.append(Vector2(x,y))
	while len(queue) > 0:
		var coords = queue.pop_back()
		x = coords.x
		y = coords.y
		if x < 0 or x >= w or y < 0 or y>=h or canvas_image.get_pixel(x,y) != old_color:
			continue
		else:
			canvas_image.set_pixel(x,y,color)
			queue.append(Vector2(x,y+1))
			queue.append(Vector2(x,y-1))
			queue.append(Vector2(x+1,y))
			queue.append(Vector2(x-1,y))

func _placeBrush(color:Color,position:Vector2i,shape,cnv) -> void:
	var offset = Vector2i(shape.get_used_rect().get_center())
	if color.a == 0:
		var newShape = BrushInfo.brushUpdateColor(Color.TRANSPARENT)
		cnv.blit_rect(newShape,newShape.get_used_rect(),position-offset)
		return
	cnv.blend_rect(shape,shape.get_used_rect(),position-offset)
