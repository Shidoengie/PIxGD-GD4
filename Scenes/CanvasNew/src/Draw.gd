extends TextureRect

var canPaint = false
var current_color : Color
@onready var canvasImg = Image.create(size.x,size.y,false,Image.FORMAT_RGBA8)

func _process(delta):
	BrushInfo.change_brush(BrushInfo.current_shape,BrushInfo.size,current_color)
	texture = ImageTexture.create_from_image(canvasImg)
	current_color = BrushInfo.primary_color if BrushInfo.is_primary else BrushInfo.secondary_color
	BrushInfo.current_color = current_color
#	if (not BrushInfo.can_paint or not BrushInfo.is_inside_canvas)  and Tools.current != Tools.LINE:
#		return
	match Tools.current:
		Tools.PEN:
			Tools.blit_brush(BrushInfo.current_position,BrushInfo.size,current_color,BrushInfo.brushImage,canvasImg)
		Tools.ERASOR:
			Tools.blit_brush(BrushInfo.current_position,BrushInfo.size,Color.TRANSPARENT,BrushInfo.brushImage,canvasImg)
		Tools.LINE:
			if Input.is_action_just_released("mouseLeft_1st") or Input.is_action_just_released("mouseRight_2nd"):
				Tools.blit_line(BrushInfo.last_position,BrushInfo.current_position,current_color,BrushInfo.size,BrushInfo.brushImage,canvasImg)
		Tools.FILL:
			Tools.floodfill(canvasImg,BrushInfo.current_position.x,BrushInfo.current_position.y,current_color)
		_:
			pass






