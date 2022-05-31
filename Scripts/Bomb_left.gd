extends Area2D

export var speed = 100

func _ready() -> void:
	Global.Bomb = self

func _process(delta: float) -> void:
	var velocity = Vector2()
	velocity.x -= speed * delta
	position += velocity
	
	
func _on_body_entered(body: Node) -> void:
	Global.Player.bomb_boost()
	print ("bomb_boost")
	queue_free()
