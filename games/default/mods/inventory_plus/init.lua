 --[[

Inventory Plus for Minetest

Copyright (c) 2012 cornernote, Brett O'Donnell <cornernote@gmail.com>
Source Code: https://github.com/cornernote/minetest-inventory_plus
License: BSD-3-Clause https://raw.github.com/cornernote/minetest-inventory_plus/master/LICENSE

Edited by TenPlus1 (23rd March 2016)

]]--

-- expose api
inventory_plus = {}

-- define buttons
inventory_plus.buttons = {}

-- default inventory page
inventory_plus.default = minetest.settings:get("inventory_default") or "main"

-- register_button
inventory_plus.register_button = function(player, name, label)

	local player_name = player:get_player_name()

	if inventory_plus.buttons[player_name] == nil then
		inventory_plus.buttons[player_name] = {}
	end

	inventory_plus.buttons[player_name][name] = label
end

-- set_inventory_formspec
inventory_plus.set_inventory_formspec = function(player, formspec)

	 -- error checking
	if not formspec then
		return
	end

	if minetest.settings:get_bool("creative_mode") then

		-- if creative mode is on then wait a bit
		minetest.after(0.01,function()
			player:set_inventory_formspec(formspec)
		end)
	else
		player:set_inventory_formspec(formspec)
	end
end

-- create detached inventory for trashcan
local trashInv = minetest.create_detached_inventory(
	"trash", {
		on_put = function(inv, toList, toIndex, stack, player)
			inv:set_stack(toList, toIndex, ItemStack(nil))
		end
	})

trashInv:set_size("main", 1)

-- get_formspec
inventory_plus.get_formspec = function(player, page)

	if not player then
		return
	end

	-- default inventory page
	local formspec = "size[8,7.5]"
		.. default.gui_bg
		.. default.gui_bg_img
		.. ""

	-- craft page
	if page == "craft" then

		local inv = player:get_inventory() or nil

		if not inv then
			print ("NO INVENTORY FOUND")
			return
		end

		 formspec = formspec
.. "button[0.0,0;2,1;blocks;Blocks]"
.. "button[2.3,0;2,1;stairs;Stairs]"
.. "button[4.6,0;2,1;slabs;Slabs]"
.. "button[0.0,1;2,1;windows;Windows]"
.. "button[2.3,1;2,1;lights;Lights]"
.. "button[4.6,1;2,1;waters;Waters]"
.. "button[0.0,2;2,1;doors;Doors]"
.. "button[2.3,2;2,1;carpets;Carpets]"
.. "button[4.6,2;2,1;trapdoor;Trapdoor]"
.. "button[0.0,3;2,1;fence;Fence]"
.. "button[2.3,3;2,1;time;Time]"
.. "button[4.6,3;2,1;chair;Chair]"
.. "button[0.0,4;2,1;table;Table]"
.. ""
.. "button[0.0,7;2,1;main;Back]"
	end
	
	-- main page
	if page == "main" then

		-- buttons
		local x, y = 2, 1

		for k, v in pairs(inventory_plus.buttons[player:get_player_name()]) do

			formspec = formspec 

.. "button[" .. x .. "," .. y .. ";4,2;" .. k .. ";" .. v .. "]"
.. "button_exit[2,5;4,2;quit;Quit]"

			x = x 
y = y + 2
		end
	end
	
	return formspec
end

-- register_on_joinplayer
minetest.register_on_joinplayer(function(player)

	inventory_plus.register_button(player,"craft", "Build")

	minetest.after(1, function()

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, inventory_plus.default))
	end)
end)

-- register_on_player_receive_fields
minetest.register_on_player_receive_fields(function(player, formname, fields)

	-- main

	if fields.main then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "main"))

		return
	end

	-- craft
	if fields.craft then

		inventory_plus.set_inventory_formspec(player,
			inventory_plus.get_formspec(player, "craft"))

		return
	end

	-- creative
	if fields.creative_prev
	or fields.creative_next then

		minetest.after(0.1, function()

			inventory_plus.set_inventory_formspec(player,
				inventory_plus.get_formspec(player, "creative"))
		end)

		return
	end
end)
