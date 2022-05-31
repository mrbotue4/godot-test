extends Node2D

#links, variables 
var bomb = preload("res://Scenes/Bomb.tscn")
var fake_bomb = preload("res://Scenes/Fake_Bomb.tscn")
var stealth_bomb = preload("res://Scenes/StealthBomb.tscn")
onready var positions = get_node("Positions")
var gamestate
var random_numbers

#random numbers for each of the game_states
var random_numbers_begin = [0,1,2,3,4,5,6,7]
var random_numbers_middle = [0,1,2,3,4,5,6,7,8]
var random_numbers_hard = [0,1,2,3,4,5,6,7,8,9]
var random_numbers_ultimate = [0,1,2,3,4,5,6,7,8,9,9]

#generates 3 bombs (0,1,2)
func _on_BombTimer_timeout() -> void:
	for i in range(3):
		generator()


#update Player Death Zone, shuffle random numbers to generate bombs, and check gamestate
func _ready() -> void:
	Global.Player.update_camera_limit()
	gamestate = Global.Gamestate.check_gamestate()
	configure_gamestate()
	
	
func configure_gamestate():
	if gamestate == "begin":
		random_numbers = random_numbers_begin
		
	elif gamestate == "middle":
		random_numbers = random_numbers_middle
		
	elif gamestate == "hard":
		random_numbers = random_numbers_hard
		
	elif gamestate == "ultimate":
		random_numbers = random_numbers_ultimate
		
	randomize()
	random_numbers.shuffle()

#generate bombs with different parameters
func generator():
	var random_number = random_numbers.pop_front()
	

	#instances of bomb scenes
	var bomb_instance = bomb.instance()
	var fake_bomb_instance = fake_bomb.instance()
	var stealth_bomb_instance = stealth_bomb.instance()
	
	#direction of bombs (RENAME IT LATER DIR > DIRECTION)
	var dir = 1
	var fake_dir = 1

	
#randomizator
	if random_number == 0:
		bomb_instance.position = $Positions/LPos1.position
		dir = 1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)


	elif random_number == 1:
		bomb_instance.position = $Positions/RPos1.position
		dir = -1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)


	elif random_number == 2:
		bomb_instance.position = $Positions/LPos2.position
		dir = 1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)


	elif random_number == 3:
		bomb_instance.position = $Positions/RPos2.position
		dir = -1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)
		
		
	elif random_number == 4:
		bomb_instance.position = $Positions/LPos3.position
		dir = 1
		bomb_instance.set_direction(dir)
		add_child(bomb_instance)


	elif random_number == 5:
		bomb_instance.position = $Positions/RPos3.position
		dir = -1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)


	elif random_number == 6:
		bomb_instance.position = $Positions/LPos4.position
		dir = 1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)


	elif random_number == 7:
		bomb_instance.position = $Positions/RPos4.position
		dir = -1
		bomb_instance.set_direction(dir)
		bomb_instance.set_speed(gamestate)
		add_child(bomb_instance)
		
		#fake_bomb generator
	elif random_number == 8:
		fake_bomb_instance.position = $Positions/LPos5.position	
		fake_dir = 1
		fake_bomb_instance.set_direction(fake_dir)
		fake_bomb_instance.set_speed(gamestate)
		add_child(fake_bomb_instance)
		
		
	elif random_number == 9:
		randomize()
		pick_random_child()
		stealth_bomb_instance.position = pick_random_child().position
		dir = 1
		stealth_bomb_instance.set_direction(dir)
		stealth_bomb_instance.set_speed(gamestate)
		add_child(stealth_bomb_instance)
		
				
#additional - for random bomb spawn 2D position (DELETE IT ????)
func pick_random_child():
	var random_id = randi() % positions.get_child_count()
	return positions.get_child(random_id)
