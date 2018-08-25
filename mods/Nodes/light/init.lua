local dyes = {
	{"black", "Darkened", "292421"}, 
	{"blue", "Blue", "0000FF"},
	{"green", "Green", "00FF00"}, 
	{"white", "White", "F5F5F5"}, 
	{"orange", "Orange", "FF6103"}, 
	{"red", "Red", "FF0000"}, 
	{"yellow", "Yellow", "FFFF00"}, 
	{"pink", "pink", "FF69B4"}
}
for i = 1, #dyes do
	local name, desc, colour = unpack(dyes[i])

	minetest.register_node("light:" .. name, {
		description = desc .. " light",
		wield_image = "color_hand" .. name .. ".png",
		wield_scale = {x=2,y=1.5,z=0.2},
      inventory_image = "lights.png^[colorize:#"..colour..":70",
		tiles = {"color_" .. name .. ".png"},
		paramtype = "light",
	  light_source = 28,
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
		
			 	})
	
end
