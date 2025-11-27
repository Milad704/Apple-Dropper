extends Sprite2D

var y_pos = 0
var x_pos = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	print ("hello world")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	y_pos += 10
	print(y_pos)
	position = Vector2(x_pos,y_pos)
	if y_pos > 650: 
		x_pos = randi_range(0, 1100)
		y_pos = 0
	pass
