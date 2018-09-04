-- Stuff

dofile(minetest.get_modpath("inventory_plus") .. "/build.lua")
dofile(minetest.get_modpath("inventory_plus") .. "/decoration.lua")
dofile(minetest.get_modpath("inventory_plus") .. "/tools.lua")
-- dofile(minetest.get_modpath("inventory_plus") .. "/noncubic.lua")
dofile(minetest.get_modpath("inventory_plus") .. "/planets.lua")

-- Initial Stuff and Delete Legacy Stuff

minetest.register_on_joinplayer(function(player) 

player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'flowers:white')
player:get_inventory():add_item('main', 'flowers:black')
player:get_inventory():add_item('main', 'flowers:red')
player:get_inventory():add_item('main', 'flowers:orange')
player:get_inventory():add_item('main', 'flowers:yellow')
player:get_inventory():add_item('main', 'flowers:pink')
player:get_inventory():add_item('main', 'flowers:green')
player:get_inventory():add_item('main', 'flowers:blue')

end)
