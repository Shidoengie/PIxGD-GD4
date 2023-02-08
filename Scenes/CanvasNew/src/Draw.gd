extends TextureRect

var canPaint = false
var current_color : Color
@onready var canvasImg = Image.create(size.x+1,size.y+1,false,Image.FORMAT_RGBA8)
func _ready():
	pass
func _process(delta):
	
	texture = ImageTexture.create_from_image(canvasImg)
	current_color = BrushInfo.primary_color if BrushInfo.is_primary else BrushInfo.secondary_color
	BrushInfo.current_color = current_color
	match Tools.current:
		Tools.PEN:
			_blit_brush(current_color,Vector2i(BrushInfo.current_position),BrushInfo.size)
		Tools.ERASOR:
			_blit_brush(Color.TRANSPARENT,Vector2i(BrushInfo.current_position),BrushInfo.size)
		Tools.LINE:
			if Input.is_action_just_released("mouseLeft_1st") or Input.is_action_just_released("mouseRight_2nd"):
				_blit_line(BrushInfo.click_position,BrushInfo.current_position,current_color,BrushInfo.size)
		_:
			pass
func _blit_brush(color:Color,position:Vector2i,brush_size:int):
	if not BrushInfo.can_paint:
		return
	canvasImg.set_pixelv(position,color)


func _blit_line(start_pos:Vector2,stop_pos:Vector2,color:Color,width:Vector2):
	pass
