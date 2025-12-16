extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()
	
func setup():
	var color_array = Array([Color(1,0,0,1),Color(1,0.25,0,1), Color(1,0.5,0,1), Color(1,0.75,0,1), Color(1,1,0,1),Color(0,1,0,1), Color(0,0,1,1),Color(0.5,0,1,1)], TYPE_COLOR, "", null)
	var brick_scene = preload("res://brick_scene.tscn")
	for i in range(8):
		for j in range(16):
			var brick = brick_scene.instantiate()
			brick.position=Vector2(120*j, 40*i)
			brick.set_color(color_array[i])
			add_child(brick)
			


func _on_ball_reset() -> void:
	for child in get_children():
		child.queue_free()
	setup()
