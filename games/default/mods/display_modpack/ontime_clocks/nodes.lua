--[[
    ontime_clocks mod for Minetest - Clock nodes displaying ingame time 
    (c) Pierre-Yves Rollo

    This file is part of ontime_clocks.

    ontime_clocks is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ontime_clocks is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ontime_clocks.  If not, see <http://www.gnu.org/licenses/>.
--]]

local source_list = {
	{"black", "Black", "000000", "808080", "0F0F0F"},
	{"blue", "Blue", "0000FF", "0000FF", "000E60"},
	{"green", "Green", "00FF00", "00FF00" , "006309"}, 
	{"white", "White", "F5F5F5", "F5F5F5", "404040"},
	{"orange", "Orange", "FF6103", "FF6103", "7F3300"},
	{"red", "Red", "FF0000", "FF0000", "770000"},
	{"yellow", "Yellow", "FFFF00", "FFFF00", "7F6A00"},
	{"pink", "pink", "FF69B4", "FF69B4", "7F006E"},
}

for i in ipairs(source_list) do
	local name = source_list[i][1]
	local desc = source_list[i][2]
	local colour = source_list[i][3]
	local colour2 = source_list[i][4]
	local colour3 = source_list[i][5]

--  digital clock

minetest.register_node("ontime_clocks:" .. name .. "_digital", {
	description = ( name .. "Digital Clock"),
   wield_image = "color_no.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	paramtype2 = "facedir",
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.25, 0.4375, -0.0625, 0.25},
			}
	},
	tiles = {
		"color_white.png^[colorize:#" .. colour .. ":150",
		"color_white.png^[colorize:#" .. colour .. ":150",
		"color_white.png^[colorize:#" .. colour .. ":150",
		"color_white.png^[colorize:#" .. colour .. ":150",
		"color_white.png^[colorize:#" .. colour .. ":150",
		"color_white.png^[colorize:#" .. colour .. ":150^ontime_clocks_digital.png",
		},
	groups = {oddly_breakable_by_hand = 1, not_blocking_trains = 1, display_modpack_node = 1},
	light_source =  14,
	display_entities = {
        ["ontime_clocks:display"] = {
            depth = -17/64 + 0.01,
            top = 1/3.56,
            on_display_update = function(pos, objref)
                objref:set_properties(
                    ontime_clocks.get_digital_properties(
                        "#" .. colour3, "#" .. colour2, ontime_clocks.get_h24(), ontime_clocks.get_m12()))
            end },
    }, 
	on_place = display_api.on_place,
	on_construct = display_api.on_construct,
	on_destruct = display_api.on_destruct,
	on_rotate = display_api.on_rotate,
})

minetest.register_abm({
	nodenames = {"ontime_clocks:" .. name .. "_digital"},
	interval = 5,
	chance = 1,
	action = display_api.update_entities,
})

end
