extends Control



func _on_basket_01_pressed() -> void:
	SkinManager.set_basket_skin("basket_01")

func _on_basket_02_pressed() -> void:
	SkinManager.set_basket_skin("basket_02")
	
func _on_basket_03_pressed() -> void:
	SkinManager.set_basket_skin("basket_03")
	
func _on_basket_04_pressed() -> void:
	SkinManager.set_basket_skin("basket_04")
	
func _on_basket_05_pressed() -> void:
	SkinManager.set_basket_skin("basket_05")
	
func _on_basket_06_pressed() -> void:
	SkinManager.set_basket_skin("basket_06")


func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://start_screen.tscn")
