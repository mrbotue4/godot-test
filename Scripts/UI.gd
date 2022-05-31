extends Node2D

signal move_player
signal restart_game

var move_vector = Vector2()

var move_active = false

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		if $MovementButton.is_pressed():
			var local_event = make_input_local(event)
			$MovementButton.position.x = local_event.position.x
			move_vector.x = local_event.position.x
			move_active = true
	if event is InputEventScreenTouch:
			move_active = false
	
func _physics_process(delta: float) -> void:
	if move_active:
		emit_signal("move_player", move_vector)


func _on_RestartButton_released() -> void:
	emit_signal("restart_game")
