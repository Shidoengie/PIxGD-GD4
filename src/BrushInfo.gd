extends Node

enum ToolEnum {PEN,LINE}
var current_tool = ToolEnum.LINE as ToolEnum
var current_position = Vector2.ZERO 
var last_position = Vector2.ZERO
var click_position = Vector2.ZERO
var is_primary
var primary_color = Color.BLACK
var secondary_color = Color.WHITE
var current_color : Color
var size = 1
var can_paint = false
