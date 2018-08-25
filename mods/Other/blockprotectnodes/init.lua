local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/API.lua")
dofile(modpath.."/crafts.lua")
dofile(modpath.."/nodes.lua")
dofile(modpath.."/boundary display.lua")
dofile(modpath.."/falling.lua")
if minetest.get_modpath("fire") then
	dofile(modpath.."/fire.lua")
end
if minetest.settings:get_bool("blockprotectnodes.sfinv_page") and minetest.get_modpath("sfinv") then
	dofile(modpath.."/sfinv.lua")
end

modpath = nil
