extends Node2D

func _process(delta):
	if Inventory.dic_selection[self.name]["b_use_switch"]:
		$Sprite2D.modulate = Color(1, 1, 1)            # 开：白
	else:
		$Sprite2D.modulate = Color(1, 1, 0.5)          # 关：黄

func _on_timer_timeout():
	if Inventory.dic_selection[self.name]["b_use_switch"]:   # 开关开着才产矿
		Inventory.dic_inventory["ore"] += 1
		Inventory.dic_selection[self.name]["b_working"] = true
	else:
		Inventory.dic_selection[self.name]["b_working"] = false

func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		get_viewport().set_input_as_handled()	#标记"已处理"，阻止传到 _unhandled_input
		Inventory.dic_selection[self.name]["b_use_switch"] = not Inventory.dic_selection[self.name]["b_use_switch"]
