extends Node2D


func _on_start_button_down():
	get_tree().change_scene_to_file("res://betterapple.tscn")



func _on_skin_page_button_down() -> void:
	get_tree().change_scene_to_file("res://store_page.tscn")
