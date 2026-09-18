extends Node2D

func _process(delta):
	if Inventory.dic_selection[self.name]["b_use_switch"]:      # 开关开着？
		$Sprite2D.modulate = Color(1, 1, 1)                 # 开：白
	else:
		$Sprite2D.modulate = Color(1, 1, 0.5)               # 关：黄

func _on_timer_timeout() -> void:
	if Inventory.dic_selection[self.name]["b_use_switch"] and Inventory.dic_inventory["ore"] > 1 and Inventory.dic_inventory["iron"] > 0:
		Inventory.dic_inventory["ore"] -= 2
		Inventory.dic_inventory["iron"] -= 1
		Inventory.dic_inventory["gear"] += 1
		Inventory.dic_selection[self.name]["b_working"] = true
	else:
		Inventory.dic_selection[self.name]["b_working"] = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_viewport().set_input_as_handled()
		Inventory.dic_selection[self.name]["b_use_switch"] = not Inventory.dic_selection[self.name]["b_use_switch"]
