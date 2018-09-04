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
	local description = source_list[i][2]
	local colour = source_list[i][3]
	local red = source_list[i][4]
	local green = source_list[i][5]
	local blue = source_list[i][6]	

-- Nodebox

minetest.register_node("driftcar:driftcar" ..name, {
	description = "Drift Car Nodebox" ..name,
inventory_image = "cars.png^[colorize:#"..colour..":70",
wield_image = "none.png",
	tiles = { -- Top, base, right, left, front, back
		"driftcar_top.png^[colorize:#"..colour..":70",
		"driftcar_base.png^[colorize:#"..colour..":70",
		"driftcar_right.png^[colorize:#"..colour..":70",
		"driftcar_left.png^[colorize:#"..colour..":70",
		"driftcar_front.png^[colorize:#"..colour..":70",
		"driftcar_back.png^[colorize:#"..colour..":70",
	},
	paramtype = "light",
paramtype2 = 'facedir',
	drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = { -- Widmin, heimin, lenmin, widmax, heimax, lenmax
				{-0.5,    0.125, -0.5,     0.5,     0.5,    0.4375}, -- Upper
				{-0.5,   -0.375, -0.5,     0.5,     0.125,  0.5},    -- Lower
				{-0.5,   -0.5,   -0.5,    -0.3125, -0.375, -0.1875}, -- Wheels
				{0.3125, -0.5,   -0.5,     0.5,    -0.375, -0.1875},
				{-0.5,   -0.5,    0.1875, -0.3125, -0.375,  0.5},
				{0.3125, -0.5,    0.1875,  0.5,    -0.375,  0.5},
			},
		},
	 groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
		sounds = default.node_sound_wood_defaults(),
})

end
