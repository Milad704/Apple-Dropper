extends Area2D

@onready var sprite: Sprite2D = $Sprite2D
# set up skins
const BASKET_TEXTURES := {
	"basket_01": preload("res://wicker-basket.png"),
	"basket_02": preload("res://basket11.png"),
	"basket_03": preload("res://basket2.png"),
	"basket_04": preload("res://basket3.png"),
	"basket_05": preload("res://basket4.png"),
	"basket_06": preload("res://basket6.png"),
}
@export var skin_id: String = "basket_01"

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
	_apply_skin(SkinManager.basket_skin_id)
func _apply_skin(id: String) -> void:
	if BASKET_TEXTURES.has(id):
		sprite.texture = BASKET_TEXTURES[id]

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
		
		
