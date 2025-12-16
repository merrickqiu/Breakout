extends CharacterBody2D

signal brick_broken
signal update_life
signal reset

var hit_this_frame = false
var life = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2(0,-500)


func _process(delta: float) -> void:
	hit_this_frame = false
	var collision = move_and_collide(velocity * delta)
	if collision:
		$AudioStreamPlayer2D.play()
		
		var collider = collision.get_collider()
		var normal = collision.get_normal()
		var remainder = collision.get_remainder()
		velocity = velocity.bounce(normal) 
		velocity = velocity.rotated(randf_range(-PI/20, PI/20))
		remainder = collision.get_remainder()
		collision = move_and_collide(remainder)
		if collider.name == "Brick" and not hit_this_frame:
			brick_broken.emit()
			collider.queue_free()
			hit_this_frame = true
			velocity = velocity.normalized()*(0.95+0.03*life)*velocity.length()
		if collider.name == "BottomWall":
			life -= 1
			update_life.emit(life)
			if life == 0:
				velocity = Vector2(0,-500)
				position = Vector2(960, 900)
				reset.emit()
				life = 3
		
