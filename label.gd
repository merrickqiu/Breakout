extends Label

var score = 0
var high_score = 0
var life = 3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_text()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func update_text():
	text = "Score: %d\nHigh Score: %d\nLife: %s" % [score, high_score, '❤️'.repeat(life)]

func _on_ball_brick_broken() -> void:
	if score % 1000 == 900:
		$Wow.play()
	score += 100
	update_text()


func _on_ball_reset() -> void:
	#if score > high_score:
		#$Applause.play()
	#else:
	$Fahhh.play()
	high_score = score
	score = 0
	life = 3
	update_text()


func _on_ball_update_life(new_life: int) -> void:
	life = new_life
	update_text()
