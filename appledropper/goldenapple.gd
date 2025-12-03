extends CharacterBody2D
#@onready var score = get_node("/root/Node2D/Basket").score

#@onready var health_label = get_node("/root/Node2D/Apple")
var spawn = false
var restart = true
func _ready():
	
	velocity = Vector2(0, 300)
	
	#health_label = get_node("/root/Node2D/HPLabel")
func golden_apple_spawn():
	var goldenapple = get_node("/root/Node2D/goldenapple")
	if restart == true:
		position.x = randi_range(0, 1100)
		position.y = 0
	goldenapple.visible = true
	goldenapple.get_node("CollisionShape2D").disabled = false
	restart = false
func _physics_process(delta:float) -> void:
	var goldenapple = get_node("/root/Node2D/goldenapple")
	print(Global.score)
	print(spawn)
	if Global.score % 5 == 0 and Global.score > 0:
		spawn = true
		Global.golden_spawn = spawn

		
	if spawn == true:
		golden_apple_spawn()
	if spawn == false:
		goldenapple.visible = false
		goldenapple.get_node("CollisionShape2D").disabled = true
	if Global.score % 5 != 0:
		spawn = false
		Global.golden_spawn = spawn

		restart = true
	
	if position.y > 660:
		position.x = randi_range(0, 1100)
		position.y = 0
	move_and_slide();

func _on_basket_body_entered(body):
	var goldenapple = get_node("/root/Node2D/goldenapple")
	if body == goldenapple:
		Global.health += 1
		#Global.health_label.text = "Health:" + str(Global.health)
	#if Global.health < 1: 
		#get_tree().reload_current_scene()
	pass # Replace with function body.
