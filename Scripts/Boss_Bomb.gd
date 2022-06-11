extends Area2D

class_name boss_bomb

#start_variables
export var speed = 300
var xpos = Vector2()
var ypos = Vector2()


#link
var reverse_area = preload ("res://Scripts/ReverseArea.gd")
var fake_bomb = preload("res://Scripts/Fake_Bomb.gd")
onready var positions = preload("res://Scenes/Positions.tscn")

func _ready() -> void:
	set_as_toplevel(true)

func _process(delta: float) -> void:
	position.y += speed * delta
	

#func move_down(delta):
	#position.y += speed * delta
	#global_position.x = xpos
	#print (self.position.x)


