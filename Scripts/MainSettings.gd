extends Node2D

#game_state constants: game progression
var gamestate = "begin"


func _ready() -> void:
	Global.Gamestate = self
	gamestate = "begin"


#change gamestates (depends on the player score)
func change_gamestate(score):
	if score < 6000:
		gamestate = "middle"
	
	if score > 19999:
		gamestate = "hard"
		print ("git11")
		
	if score > 24999:	
		gamestate = "ultimate"

#check what gamestate is active
func check_gamestate():
	return gamestate

func _on_UI_restart_game() -> void:
	get_tree().reload_current_scene()
