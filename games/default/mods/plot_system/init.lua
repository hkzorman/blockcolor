--
-- PLOT: [true --or-- false]
--

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "singlenode" then

dofile(minetest.get_modpath("plot_system").."/plot.lua")

else
	
end