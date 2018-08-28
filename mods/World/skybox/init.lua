minetest.register_on_joinplayer(function(player)
    minetest.setting_set("time_speed", 0)
minetest.setting_set("time", 12000)
end)

minetest.register_on_shutdown(function(player)
    minetest.setting_set("time_speed", 0)
minetest.setting_set("time", 12000)
end)

--Version 0.2

pos = {x=0, y=0, z=0}

local space = 3950 --value for space, change the value to however you like.

--The skybox for space, feel free to change it to however you like.

local skybox = {
"sky.png",
"sky.png",
"sky_1.png",
"sky.png",
"sky.png",
"sky.png",

}

local spaceskybox = {
"space.png",
"space.png",
"space_1.png",
"space.png",
"space.png",
"space.png",

}

local time = 0

minetest.register_globalstep(function(dtime)
time = time + dtime
if time > 1 then for _, player in ipairs(minetest.get_connected_players()) do
time = 0

local name = player:get_player_name()
local pos = player:getpos()

--If the player has reached Space
if minetest.get_player_by_name(name) and pos.y >= space then
player:set_physics_override(1, 0.3, 0.1) -- speed, jump, gravity
player:set_sky({}, "skybox", spaceskybox) -- Sets skybox

--If the player is on Earth
elseif minetest.get_player_by_name(name) and pos.y < space then
player:set_physics_override(1, 1, 1) -- speed, jump, gravity [default]
player:set_sky({}, "skybox", skybox) -- Sets skybox, in this case it sets the skybox to it's default setting if and only if the player's Y value is less than the value of space.

end end end end)

minetest.register_on_leaveplayer(function(player)

local name = player:get_player_name()

if name then
 player:set_sky({}, "skybox", skybox)

end end)
