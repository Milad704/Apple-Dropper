extends Area2D


#var score = 0
var score_label 
# Called when the node enters the scene tree for the first time.
func _ready():
	score_label = get_node("/root/Node2D/ScoreLabel")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 8
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += 8
	pass


func _on_body_entered(body):
	print("i am being touched");
	Global.score += 1
	score_label.text = "Score:" + str(Global.score)

	pass # Replace with function body.
