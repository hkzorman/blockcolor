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

	minetest.register_node("carpet:" .. name, {

description = desc .. " Carpet color",
	drawtype = "raillike",
	tiles = {"color_" .. name .. ".png"},
   wield_image = "color_hand" .. name .. ".png",
   inventory_image = "carpets.png^[colorize:#"..colour..":70",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	is_ground_content = true,
	walkable = false,
	buildable_to = true,
	selection_box = {
		type = "fixed",
                
                fixed = {-1/2, -1/2, -1/2, 1/2, -1/2+1/16, 1/2},
	},
	groups = {dig_immediate=3},

			 	})
	
end
