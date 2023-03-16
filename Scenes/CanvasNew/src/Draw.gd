extends TextureRect

var canPaint = false
var current_color : Color
@onready var canvasImg = Image.create(size.x,size.y,false,Image.FORMAT_RGBA8)

func _process(delta):
	
	texture = ImageTexture.create_from_image(canvasImg)
	current_color = BrushInfo.primary_color if BrushInfo.is_primary else BrushInfo.secondary_color
	BrushInfo.current_color = current_color
	BrushInfo.brushUpdate()
	if (not BrushInfo.can_paint or not BrushInfo.is_inside_canvas) and Tools.current != Tools.LINE:
		BrushInfo.click_position = BrushInfo.current_position
		return
	match Tools.current:
		Tools.PEN:
			
			Tools.blit_brush(BrushInfo.current_position,BrushInfo.size,current_color,BrushInfo.brushImage,canvasImg)
		Tools.ERASOR:
			Tools.blit_brush(BrushInfo.current_position,BrushInfo.size,Color.TRANSPARENT,BrushInfo.brushImage,canvasImg)
		Tools.LINE:
			_lineTool()
		Tools.FILL:
			Tools.floodfill(canvasImg,BrushInfo.current_position.x,BrushInfo.current_position.y,current_color)
		_:
			pass

func _lineTool():
	if not Input.is_action_pressed("mouseLeft_1st") or not Input.is_action_pressed("mouseRight_2nd"):
		BrushInfo.click_position = BrushInfo.current_position
	if Input.is_action_just_released("mouseLeft_1st") or Input.is_action_just_released("mouseRight_2nd"):
		Tools.blit_line(BrushInfo.click_position,BrushInfo.current_position,current_color,BrushInfo.size,BrushInfo.brushImage,canvasImg)

