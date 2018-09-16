-- Carpet Mod!
-- By Jordan Snelling 2012
-- License LGPL
-- This mod adds carpets into Minetest.

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

	minetest.register_node("trampoline:trampoline_"..name, {
		description = desc.."Trampoline",
		tiles = {"trampoline.png^[colorize:#"..colour..":70", "trampoline.png^[colorize:#"..colour..":70", "trampoline_sides.png^[colorize:#"..colour..":70"},
		groups = {cracky=3, oddly_breakable_by_hand=1, fall_damage_add_percent=-100, bouncy=99},
		paramtype = "light",
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
		}
	})
	
end
