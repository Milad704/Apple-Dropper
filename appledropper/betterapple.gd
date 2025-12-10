extends CharacterBody2D
#@onready var Apple = get_node("/root/Node2D/Basket")
func _ready():
	
	velocity = Vector2(0, 300)
	
func _physics_process(delta:float) -> void:
	var apple = get_node("/root/Node2D/Apple")
	if Global.golden_spawn:
		apple.visible = false
		return  # stop normal apple logic
	apple.visible = true
	if position.y > 660:
		position.x = randi_range(0, 1100)
		position.y = 0
	move_and_slide();
	


func _on_floor_body_entered(body):
	Global.health -= 1
	if Global.health < 1:
		Global.score = 0
		get_tree().change_scene_to_file("res://death_screen.tscn")
		Global.health = 3
	#Global.health_label.text = "Health:" + str(Global.health)
	pass # Replace with function body.


func _on_basket_body_entered(body):
	var obstacle = get_node("/root/Node2D/Obstacle") 
	if body != obstacle:
		position.x = randi_range(0, 1100)
		position.y = 0
	pass # Replace with function body.
