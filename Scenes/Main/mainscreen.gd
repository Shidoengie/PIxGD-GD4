extends Control
@onready var ZoomSlider = %ZoomSlider
@onready var ZoomInput = %ZoomInput
@onready var Canvas = %Canvas

# Called when the node enters the scene tree for the first time.
func _ready():
	%PrimaryColorPicker.color = BrushInfo.primary_color
	%SecondaryColorPicker.color = BrushInfo.secondary_color
func _process(delta):
	pass
	
func _on_canvas_zoom_changed(value):
	ZoomInput.text = str(round(value.x*100))
	ZoomSlider.value = value.x*100
func _on_zoom_input_text_submitted(new_text:String):
	if not new_text.is_valid_int():
		ZoomInput.text = str(round(Global.canvas_zoom.x*100))
		return
	ZoomSlider.value = int(new_text)
	Canvas.update_zoom(Vector2(ZoomSlider.value,ZoomSlider.value)/100)

func _on_zoom_slider_value_changed(value):
	ZoomInput.text = str(round(value))
	

func _on_zoom_slider_drag_ended(value_changed):
	if value_changed:
		var zoomVec = Vector2(ZoomSlider.value,ZoomSlider.value)/100
		Canvas.update_zoom(zoomVec)
		Global.canvas_zoom = zoomVec


func _on_primary_color_picker_color_changed(color):
	BrushInfo.primary_color = color


func _on_secondary_color_picker_color_changed(color):
	BrushInfo.secondary_color = color
