extends Node

#全物品
var dic_inventory = {
	"ore"	= 	0, 
	"gear"	= 	0,
	"iron"	=	0
}

#全物品中文
var dic_inventory_chinese = {
	"ore"	= "矿石", 
	"gear"	= "齿轮",
	"iron"	= "铁锭"
}

#全设备中文
var dic_equipment_chinese = {
	"Furnace"	= "熔炉",
	"Miner"		= "采矿机",
	"Assembler"	= "汇编器"
}

#判断是否被选中
var dic_selection = {	# b_use_switch=用户开关, b_working=实际生产
	#示例：	"Furnace"	= {"b_use_switch" = true,  "b_working" = false},
}

var dic_build_type_preload = {
	"Miner" = preload("res://tscn_N2_miner.tscn"),
	"Furnace" = preload("res://tscn_N2_furnace.tscn"),
	"Assembler" = preload("res://tscn_N2_assembler.tscn")
}

var dic_equipment_amount = {
	"Furnace"	= 0,
	"Miner"		= 0,
	"Assembler"	= 0
}
