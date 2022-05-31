extends Node2D

var min_x =  -200
var max_x = 500
var min_y = 0
var max_y = 0

func _ready() -> void:
	movement()
	
func movement():
		randomize()
		$Tween.interpolate_property($Sprite, "position", Vector2(rand_range(min_x, max_x), rand_range(min_y, max_y)), Vector2(rand_range(min_x, max_x), rand_range(min_y, max_y)), 3, Tween.TRANS_CUBIC, Tween.EASE_OUT)
		$Tween.start() 
