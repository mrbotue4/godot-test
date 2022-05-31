extends Area2D

export var speed = 250
var direction = 1
var velocity = Vector2()


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
func set_direction(fake_dir):
	direction = fake_dir
	
#Player boost	
func _on_body_entered(body: Node) -> void:
	Global.Player.fake_boost()
	queue_free()


#Reverse bomb
func _on_area_entered(area: Area2D) -> void:
	direction *= -1



