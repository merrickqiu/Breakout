extends Node2D

var screen_x
var screen_y
var high_score = 0 
var score = 0
func _ready() -> void:
	screen_x = get_viewport_rect().size.x
	screen_y = get_viewport_rect().size.y
