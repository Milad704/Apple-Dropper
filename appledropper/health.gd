extends Node
var health = 3
var score = 0
var golden_spawn = false

#var health_label
#func _ready():
	#health_label = get_node("/root/Node2D/HPLabel")
	#pass
#func _physics_process(delta:float) -> void:
	#if is_instance_valid(health_label):
		#health_label.text = "Health: " + str(health)
	#if health < 1: 
		#get_tree().reload_current_scene()
