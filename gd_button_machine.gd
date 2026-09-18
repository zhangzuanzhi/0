extends Label

func _process(delta: float) -> void:
	var str_show = ""  
	for str_machine in Inventory.dic_selection.keys(): # ② 列每台机器
		var dic_card = Inventory.dic_selection[str_machine]      # 开抽屉拿卡
		str_show += Inventory.dic_equipment_chinese[str_machine] + ": "
		if dic_card["b_use_switch"]:                   # 看开关那一栏
			str_show += "运行中"
			if dic_card["b_working"] == false:         # 开着但没原料 → 停工
				str_show += "（停工）"
		else:
			str_show += "已停止"
		str_show += "\n"
	text = str_show
