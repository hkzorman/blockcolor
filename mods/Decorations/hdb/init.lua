-- HomeDecor Blockcolor

local source_list = {
	{"black", "white", "292421", 40, 36, 33}, 
	{"blue", "white", "0000FF", 0, 0, 255},
	{"green", "white", "00FF00", 0, 255, 0}, 
	{"white", "black", "F5F5F5", 245, 245, 245}, 
	{"orange", "black", "FF6103", 255, 97, 3}, 
	{"red", "white", "FF0000", 255, 0, 0}, 
	{"yellow", "black", "FFFF00", 255, 255, 0}, 
	{"pink", "white", "FF69B4", 255, 105, 180}
}

for i in ipairs(source_list) do
	local color = source_list[i][1]
	local color2 = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

minetest.register_node("hdb:desk" .. color, {
	description = "Desk" .. color,
   drawtype = "mesh",
	mesh = "homedecor_desk.obj",
	 tiles = {"color_" ..color.. ".png", "color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_"..color..".png"},
	inventory_image = 'desk.png^[colorize:#'..colour..':70',
		wield_image = "none.png",
		wield_scale = {x=2,y=1.5,z=0.2},
	 paramtype = "light",
	paramtype2 = "facedir",
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_stone_defaults(),
 	on_place = minetest.rotate_node,
})

minetest.register_node("hdb:computer" .. color , {
	description = "Computer" .. color,
inventory_image = 'computer.png^[colorize:#'..colour..':70',
		wield_image = "none.png",
		wield_scale = {x=2,y=1.5,z=0.2},
	drawtype = "mesh",
	mesh = "computer_monitor.obj",
	tiles = {"color_" ..color.. ".png", "color_" ..color2.. ".png", "color_" ..color2.. ".png", "color_"..color..".png"},
	paramtype = "light",
	paramtype2 = "facedir",
	 groups = {cracky=3, oddly_breakable_by_hand=2},
	sounds = default.node_sound_stone_defaults(),
 	on_place = minetest.rotate_node,
})

end
