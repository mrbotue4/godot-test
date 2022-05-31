extends Area2D

#start_variables
export var speed = 200
var direction = 1
var velocity = Vector2()

#other_areas_ref
var bomb = preload("res://Scripts/Bomb.gd")
var fake_bomb = preload("res://Scripts/Fake_Bomb.gd")
var reverse_area = preload("res://Scripts/ReverseArea.gd")
onready var positions = preload("res://Scenes/Positions.tscn")

#functions to generate different bomb speed
func set_speed(gamestate):
	if gamestate == "begin":
		speed = rand_range(150,200)
	elif gamestate ==  "middle":
		speed = rand_range(200,300)
	elif gamestate ==  "hard":
		speed = rand_range(300,400)
	elif gamestate ==  "ultimate":
		speed = rand_range(450,550)

func _physics_process(delta: float) -> void:
	velocity.x = speed * delta * direction
	position += velocity
	
#set direction to bomb when generate it on scene
func set_direction(dir):
	direction = dir
	
#Player boost	
func _on_body_entered(body: Node) -> void:
	if body is Player:
		Global.Player.bomb_boost()
		queue_free()



#Reverse bomb

func _on_area_entered(area: Area2D) -> void:
	if area is bomb:
		print ("fuck")
		randomize()
		pick_random_child()
		position = pick_random_child().position
		print ("new pos", position)
	elif area is fake_bomb:
		print ("fuck")
		randomize()
		pick_random_child()
		position = pick_random_child().position
		
	elif area is reverse_area:
		direction *= -1


func pick_random_child():
	var positions_instance = positions.instance()
	var random_id = randi() % positions_instance.get_child_count()
	return positions_instance.get_child(random_id)


#disable collision when stealth mode ON
func stealth_on():
	get_node("CollisionShape2D").disabled = true
	
func stealth_off():
	get_node("CollisionShape2D").disabled = false
	 



