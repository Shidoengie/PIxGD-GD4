extends Node

enum ToolEnum {PEN}
var current_tool:ToolEnum
var current_position = Vector2.ZERO 
var last_position = Vector2.ZERO
var is_primary
var primary_color = Color.BLACK
var secondary_color = Color.WHITE
var size = 10
var can_paint = false
