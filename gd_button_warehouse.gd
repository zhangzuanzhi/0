extends Label

func _process(delta: float) -> void:
	var str_show = ""                                  # 输出文本，先清空
	for str_key in Inventory.dic_inventory.keys():     # ① 列资源（你会的旧部分）
		str_show += Inventory.dic_inventory_chinese[str_key] + ": " + str(Inventory.dic_inventory[str_key]) + "\n"
	str_show += "\n"
	text = str_show
