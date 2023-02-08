extends Node

enum {PEN,LINE,ERASOR}
var current = PEN
func floodfill(canvas_image,x,y,color):
	canvas_image.lock()
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
		if x < 0 or x > w or y < 0 or y>=h or canvas_image.get_pixel(x,y) != old_color:
			continue
		else:
			canvas_image.set_pixel(x,y,color)
			queue.append(Vector2(x,y+1))
			queue.append(Vector2(x,y-1))
			queue.append(Vector2(x+1,y))
			queue.append(Vector2(x-1,y))

