extends KinematicBody2D

class_name Player

export var gravity = 300
export var boost = -800
export var speed = 300


#Player_score
var Player_score = 0


#vectors
var velocity = Vector2()
var UP = Vector2(0,-1)

#additional variables for super (mega) boost setting
onready var bomb_number = 0
var can_mega_boost = false
var mega_boost_ready = true
var mega_boost_activated = false



func _ready() -> void:
	Global.Player = self
	bomb_boost()
	print ("1")


	
func _physics_process(delta: float) -> void:
	fall(delta)
	#movement(delta)
	move_and_slide(velocity, UP)
	count_score()

	
		
func fall(delta):
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y += gravity * delta
	
		


#standart bomb boost
func bomb_boost():
	if bomb_number == 2 and can_mega_boost and mega_boost_ready: #выполняем условия для мега буста
		if velocity.y > - 1000: #делаем не повторяющийся мега-буст при долгом полете
			mega_boost()

			
		
	if velocity.y < -1500 and mega_boost_activated: #условие при мега-бусте - ограничиваем максимальную скорость
			velocity.y = -2000

			
	else: #стандартный прыжок
		mega_boost_activated = false
		bomb_number += 1 # верно что здесь?
		velocity.y = boost 
		$Mega_boost_Timer.start()
		can_mega_boost = true
		
		

func fake_boost():
	if not mega_boost_ready: #переделать - сделать так чтобы при очень сильных ускорениях сильнее откидывало вниз
		velocity.y = 3 * gravity
	velocity.y += 2 * gravity

	

#megaboost (bonus)	
func mega_boost():
	velocity.y = 2 * boost

	bomb_number = 0
	can_mega_boost = false
	mega_boost_ready = false
	mega_boost_activated = true
	$Mega_boost_Timer.stop()
	yield(get_tree().create_timer(3.0), "timeout") # добавить в таймер функцию возвращения свойств megaboost
	mega_boost_ready = true
	
func _on_Mega_boost_Timer_timeout() -> void:
	can_mega_boost = false
	bomb_number = 0
		
	

#counting player score 
func count_score():
	if velocity.y < 0:
		Player_score += 10
	if Player_score <= 0:
		Player_score = 0
		
	Global.Score.update_score(Player_score)
	
	if Player_score == 5000:
		Global.Gamestate.change_gamestate(Player_score)
	if Player_score == 20000:
		Global.Gamestate.change_gamestate(Player_score)
	if Player_score == 25000:
		Global.Gamestate.change_gamestate(Player_score)

#moving player by touch (signal from UI)
func _on_UI_move_player(move_vector) -> void:
	velocity.x = move_vector.x

#обновляем лимиты камеры игрока
func update_camera_limit():
	if position.y > -1000:
		$Camera2D.limit_bottom = 1000
	else:
		$Camera2D.limit_bottom -= 500

#убиваем персонажа при вылете за границы экрана
func _on_DeathZone_screen_exited() -> void:
	queue_free()



