extends Node2D

var texture = preload ("res://Scenes/Background.tscn")

var texture_width = 1024

var texture_position = global_position



func _process(delta: float) -> void:
	if texture_position.distance_to(Global.Player.global_position) < 5000:
		generate_texture()


	
func generate_texture():
	
	var texture_instance = texture.instance()
	add_child(texture_instance)
	texture_instance.global_position.y = texture_position.y	
	texture_position.y = texture_position.y - texture_width
	
	
