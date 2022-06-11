extends Camera2D

#линк на бомбу генерируемую боссом
var Boss_bomb = preload("res://Scenes/Boss_Bomb.tscn")

func _ready() -> void:
	Global.Player_Camera = self
	
func start_position(): #генерация бомбы в этой позиции в этом слое
	var Boss_bomb_instance = Boss_bomb.instance() 
	Boss_bomb_instance.global_position = Vector2(200,0)
	
	add_child(Boss_bomb_instance)
	print (Boss_bomb_instance.position)
