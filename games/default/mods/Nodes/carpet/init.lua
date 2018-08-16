-- Carpet Mod!
-- By Jordan Snelling 2012
-- License LGPL
-- This mod adds carpets into Minetest.

local dyes = {
	{"white",      "White",      "basecolor_white"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"orange",     "Orange",     "excolor_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
}

for i = 1, #dyes do
	local name, desc, craft_color_group = unpack(dyes[i])

	minetest.register_node("carpet:" .. name, {

description = desc .. " Carpet color",
	drawtype = "raillike",
	tiles = {"color_" .. name .. ".png"},
   wield_image = "color_hand" .. name .. ".png",
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