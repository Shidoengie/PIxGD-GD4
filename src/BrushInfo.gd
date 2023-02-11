extends Node
enum {SQUARE,ROUND,LINE}
var type = ROUND

var current_position = Vector2.ZERO 
var last_position = Vector2.ZERO
var click_position = Vector2.ZERO
var is_inside_canvas = true
var is_primary
var primary_color = Color.BLACK
var secondary_color = Color.WHITE
var current_color : Color
var size = 20
var can_paint = false
var brushImage : Image
func _ready():
	change_brush(type,size,current_color)
func change_brush(brush_type,size,color) -> void:
	match brush_type:
		SQUARE:
			brushImage = _compute_square_brush(size,color)
		ROUND:
			brushImage = _compute_round_brush(size/2,color)
		_:
			pass
func _compute_round_brush(radius:int,color:Color) -> Image:
	var origin = Vector2(radius,radius)
	var output = Image.create(radius*2,radius*2,false,Image.FORMAT_RGBA8)
	for x in range(-radius,radius):
		var height = sqrt(radius*radius-x*x)
		for y in range(-height,height):
			output.set_pixel(x+origin.x,y+origin.y,color)
	return output
func _compute_square_brush(size,color):
	var output = Image.create(size,size,false,Image.FORMAT_RGBA8)
	output.fill(color)
	return output
