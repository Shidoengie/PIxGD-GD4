extends Control
@onready var ZoomInput = %ZoomInput
@onready var Canvas = %Canvas

# Called when the node enters the scene tree for the first time.
func _ready():
	%PrimaryColorPicker.color = BrushInfo.primary_color
	%SecondaryColorPicker.color = BrushInfo.secondary_color
func _process(delta):
	$CanvasLayer/Label.text = str(BrushInfo.last_position)+" "+str(BrushInfo.current_position)

func _on_primary_color_picker_color_changed(color):
	BrushInfo.primary_color = color
	
func _on_secondary_color_picker_color_changed(color):
	BrushInfo.secondary_color = color


func _on_zoom_input_value_changed(value):
	Canvas.update_zoom(Vector2(value,value)/100)


func _on_canvas_zoom_changed(value):
	ZoomInput.value = value.x*100

func _input(event):
	pass
