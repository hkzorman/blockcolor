--[[
Coloured Glass by JBR
Code License: CC0
Texture License: CC BY-SA 3.0
--]]

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

minetest.register_node("glass:" .. name , {
	description = name .. "Glass",
	drawtype = "glasslike",
	tiles = { name .. "glass.png"},
   inventory_image = "windows.png^[colorize:#"..colour..":70",
   wield_image = "color_hand" .. name .. ".png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})

end
