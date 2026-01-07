extends Node

signal basket_skin_changed(id: String)

var basket_skin_id: String = "basket_01"

func set_basket_skin(id: String) -> void:
	if basket_skin_id == id:
		return
	basket_skin_id = id
	basket_skin_changed.emit(basket_skin_id)
