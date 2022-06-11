extends Node2D

#для анимации босса
onready var tween = get_node("Tween")
var boss_position = Vector2()
var y = 0



#линк на бомбу генерируемую боссом
var Boss_bomb = preload("res://Scenes/Boss_Bomb.tscn")

func _ready() -> void:
	randomize()
	movement()
	print (CanvasLayer)
	Global.Boss = self

func _physics_process(delta: float) -> void:
	if $Sprite/RayCast2D.is_colliding():
		print("collide")
	
func movement():
	tween.start() 
	tween.interpolate_property($Sprite, "position", $Sprite.position, Vector2 (rand_range(-100,-200), y), 3, Tween.TRANS_CUBIC, Tween.EASE_OUT)
	yield(tween, "tween_completed")
	drop_bomb()

	
	tween.interpolate_property($Sprite, "position", $Sprite.position, Vector2 (rand_range(200, 300), y), 3, Tween.TRANS_CUBIC, Tween.EASE_OUT, 2)
	yield(tween, "tween_completed")
	drop_bomb()
	
func drop_bomb():
	var Boss_bomb_instance = Boss_bomb.instance()
	Boss_bomb_instance.position = $Sprite/RayCast2D.position




	
  
		
