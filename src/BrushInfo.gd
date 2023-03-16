extends Node
enum {SQUARE,ROUND,LINE}
var current_shape = ROUND

var current_position = Vector2.ZERO 
var last_position = Vector2.ZERO
var click_position = Vector2.ZERO
var is_inside_canvas = true
var is_primary
var primary_color = Color.BLACK
var secondary_color = Color.WHITE
var current_color : Color
var size = 1
var can_paint = false
var brushImage : Image
func _process(delta):
	_change_brush(current_shape,size,current_color)
func brushUpdateColor(color):
	_change_brush(current_shape,size,color)
	current_color = color
	return brushImage
func brushUpdate():
	_change_brush(current_shape,size,current_color)
	return brushImage
func _change_brush(brush_type,size,color) -> void:
	match brush_type:
		SQUARE:
			brushImage = _compute_square_brush(size,color)
		ROUND:
			brushImage = _compute_round_brush(size,color)
		_:
			pass
func _compute_round_brush(radius:int,color:Color) -> Image:
	
	var origin = Vector2(radius,radius)
	var output = Image.create(radius,radius,false,Image.FORMAT_RGBA8)
	if radius in [1,2]:
		output.fill(color)
		return output
	for x in range(-radius,radius):
		var height = sqrt(radius*radius-x*x)
		for y in range(-height,height):
			output.set_pixel(x+origin.x,y+origin.y,color)
	return output
func _compute_square_brush(size,color):
	var output = Image.create(size,size,false,Image.FORMAT_RGBA8)
	output.fill(color)
	return output
