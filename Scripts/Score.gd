extends Label

func _ready() -> void:
	Global.Score = self
	
func update_score(score):
	self.text = str(score)

