local source_list = {
	{"black", "Darkened", "292421", 40, 36, 33}, 
	{"blue", "Blue", "0000FF", 0, 0, 255},
	{"green", "Green", "00FF00", 0, 255, 0}, 
	{"white", "White", "F5F5F5", 245, 245, 245}, 
	{"orange", "Orange", "FF6103", 255, 97, 3}, 
	{"red", "Red", "FF0000", 255, 0, 0}, 
	{"yellow", "Yellow", "FFFF00", 255, 255, 0}, 
	{"pink", "pink", "FF69B4", 255, 105, 180}
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]

	minetest.register_node("color:" .. name, {
		description = desc .. " color",
		wield_image = "none.png",
		wield_scale = {x=2,y=1.5,z=0.2},
      inventory_image = "blocks.png^[colorize:#"..colour..":70",
		tiles = {"color_" .. name .. ".png"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
			 	})
	
end
