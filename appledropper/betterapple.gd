extends CharacterBody2D
var health = 3
var health_label
func _ready():
	health_label = get_node("/root/Node2D/HPLabel")
	velocity = Vector2(0, 300)
	
func _physics_process(delta:float) -> void:
	if position.y > 660:
		position.x = randi_range(0, 1100)
		position.y = 0
	move_and_slide();
	


func _on_floor_body_entered(body):
	health -= 1
	health_label.text = "Health:" + str(health)
	if health < 1: 
		get_tree().reload_current_scene()
	pass # Replace with function body.
