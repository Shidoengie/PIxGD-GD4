extends Node
enum {SQUARE,ROUND,LINE}
var type = SQUARE
var current_position = Vector2.ZERO 
var last_position = Vector2.ZERO
var click_position = Vector2.ZERO
var is_primary
var primary_color = Color.BLACK
var secondary_color = Color.WHITE
var current_color : Color
var size = 1
var can_paint = false
var brushImage : Image
func change_brush(brush_type,size):
	match brush_type:
		SQUARE:
			pass
		ROUND:
			pass
		_:
			pass
func change_size(new_size):
	pass
func _create_brush():
	pass
func _compute_round_brush():
	pass
func _compute_square_brush():
	pass
