extends Node2D

var str_current_build = "Miner"   # 默认先选矿机# 用的时候：
var b_right_current = true

func _ready() -> void:
	$CanvasLayer/ScrollContainer_Warehouse.visible = false
	$CanvasLayer/ScrollContainer_Machine.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.is_pressed():
		if event.keycode == KEY_1:
			str_current_build = "Miner"
			b_right_current = true
		elif event.keycode == KEY_2:
			str_current_build = "Furnace"
			b_right_current = true
		elif event.keycode == KEY_3:
			str_current_build = "Assembler"
			b_right_current = true
		else :
			b_right_current = false
		
	if event is InputEventMouseButton and event.is_pressed() and event.button_index == MOUSE_BUTTON_LEFT and b_right_current:
		var v_mouse_pos = get_global_mouse_position()
		var v_space = get_world_2d().direct_space_state
		var v_query = PhysicsPointQueryParameters2D.new()
		v_query.position = v_mouse_pos
		v_query.collide_with_areas = true
		var v_hits = v_space.intersect_point(v_query)
		if v_hits.is_empty():
			var str_new_furnace_name = str_current_build + str(Inventory.dic_equipment_amount[str_current_build])
			Inventory.dic_selection[str_new_furnace_name] = {"b_use_switch" = true, "b_working" = false}
			Inventory.dic_equipment_chinese[str_new_furnace_name] = Inventory.dic_equipment_chinese[str_current_build] + str(Inventory.dic_equipment_amount[str_current_build])
			var new_machine = Inventory.dic_build_type_preload[str_current_build].instantiate()
			new_machine.position = get_global_mouse_position()
			new_machine.name = str_new_furnace_name
			add_child(new_machine)
			Inventory.dic_equipment_amount[str_current_build] += 1

func _on_Button_Warehouse_pressed() -> void:
	$CanvasLayer/ScrollContainer_Warehouse.visible = not $CanvasLayer/ScrollContainer_Warehouse.visible
	pass # Replace with function body.


func _on_Button_Machine_pressed() -> void:
	$CanvasLayer/ScrollContainer_Machine.visible = not $CanvasLayer/ScrollContainer_Machine.visible
	pass # Replace with function body.
