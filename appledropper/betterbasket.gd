extends Area2D

var score_label
var obstacle

var vel_y = 0
var gravityy = 200
var jump_force = -200
var floor_y = 629
var can_jump = true

var normal_speed = 300
var speed = 300

func _ready():
	score_label = get_node("/root/Node2D/ScoreLabel")
	obstacle = get_node("/root/Node2D/Obstacle")  # your obstacle node

func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= speed * delta
	elif Input.is_key_pressed(KEY_RIGHT):
		position.x += speed * delta

	vel_y += gravityy * delta
	position.y += vel_y * delta

	if position.y >= floor_y:
		position.y = floor_y
		vel_y = 0
		can_jump = true

	if can_jump and Input.is_key_pressed(KEY_UP):
		vel_y = jump_force
		can_jump = false


func _on_body_entered(body):
	if body == obstacle:
		speed = 30   # <-- slow to 30
	else:
		Global.score += 1
		if score_label:
			score_label.text = "Score:" + str(Global.score)


func _on_body_exited(body):
	if body == obstacle:
		speed = normal_speed   # restore
